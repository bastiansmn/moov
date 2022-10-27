const db = require("../model/index");
const User = db.user;
const Role = db.role;
const SavedEvent = db.savedEvent;
const City = db.cities;
const Op = db.Sequelize.Op;
var jwt = require("jsonwebtoken");
const config = require("../config/auth.config");
const { v4: uuid } = require("uuid");
var bcrypt = require("bcryptjs");
const { fetchEvent } = require("../utils/eventFetching");

exports.getUsers = async (_req, res) => {
   User.findAll({
      include: [{
         model: Role,
         attributes: ["name"],
      }]
   }).then(users => {
      res.status(200).send(users
         .map(user => {
            // eslint-disable-next-line no-unused-vars
            const { password, ...u } = user.dataValues;
            return u;
         }).map(user => ({
            ...user,
            roles: user.roles.map(r => r.name)
      })));
   }).catch(err => {
      console.error(err);
      res.status(400).send({
         message: "Impossible de récupérer tous les utilisateurs"
      });
   });
}

exports.createUser = (req, res) => {
   const username = req.body.username;
   const email = req.body.email;
   const password = req.body.password;
   const roles = req.body.roles;
   const birthyear = req.body.birthyear;

   if (!username || !email || !password || !roles || !birthyear) {
      res.status(400).send({
         message: "Tous les champs sont requis"
      });
      return;
   }

   User.create({
      user_uuid: uuid(),
      username: req.body.username,
      email: req.body.email,
      password: bcrypt.hashSync(req.body.password, 8),
      birthyear: req.body.birthyear,
      city_id: req.body.city_id || "paris"
   }).then(user => {
      roles.forEach(r => {
         Role.findOne({
            where: {
               name: r
            }
         }).then(role => {
            user.addRole(role);
         });
      });
      // eslint-disable-next-line no-unused-vars
      const { password, ...u } = user.dataValues;
      res.status(200).send({
         ...u,
         roles: roles.filter(r => r === "USER" || r === "MODERATOR" || r === "ADMIN"),
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({ message: err.message });
   });

}

exports.updateRoles = async (req, res) => {
   if (!req.body.target_user_uuid) {
      res.status(400).send({
         message: "Aucun user spécifié"
      });
      return;
   }
   if (!req.body.roles) {
      res.status(400).send({
         message: "Aucun rôle spécifié"
      });
      return;
   }
   const availableRoles = (await Role.findAll({
      attributes: ["name"]
   })).map(r => r.name);
   const roles = req.body.roles.filter(r => availableRoles.includes(r) && r !== "USER");
   roles.push("USER");
   if (roles.length === 0) {
      res.status(400).send({
         message: "Les rôles sont invalides"
      });
      return;
   }
   User.findOne({
      include: [{
         model: Role,
         attributes: ["name"],
      }],
      where: {
         user_uuid: {
            [Op.eq]: req.body.target_user_uuid
         }
      },
      includes: ["roles"]
   }).then(async user => {
      await user.setRoles([]);
      roles.forEach(r => {
         Role.findOne({
            where: {
               name: {
                  [Op.eq]: r
               }
            }
         }).then(roleToAdd => {
            user.addRole([roleToAdd.role_id]);
         });
      });
      res.status(200).send({
         message: "Rôle(s) modifié(s)"
      })
   }).catch(err => {
      console.error(err);
      res.status(400).send({
         message: "Impossible de mofifier le rôle",
      });
   });
}

exports.getUserByUUID = (req, res) => {
   User.findOne({
      where: {
         user_uuid: {
            [Op.eq]: req.query.user_uuid,
         }
      }
   }).then(user => {
      if (!user) throw new Error("Impossible de récupérer le user");
      var token = jwt.sign({ user_uuid: user.user_uuid }, config.secret, {
         expiresIn: 3600 * 24 * 31 // 1 Month
      });
      user.getRoles().then(r => {
         var authorities = [];
         r.forEach(role => {
            authorities.push(role.name.toUpperCase());
         });
         // eslint-disable-next-line no-unused-vars
         const { password, ...u } = user.dataValues;
         res.status(200).send({
            ...u,
            roles: authorities,
            accessToken: token,
         });
      })
   }).catch(err => {
      console.error(err);
      res.status(404).send({
         message: "Utilisateur non trouvé"
      });
   });
};

exports.setUserRecommandations = (req, res) => {
   if (!req.body.user_uuid) {
      res.status(400).send({
         message: "Aucun utilisateur spécifié",
      });
      return;
   }
   if (req.body.recommandationsVal === undefined) {
      res.status(400).send({
         message: "Aucune valeur de notification spécifiée",
      });
      return;
   }

   User.update({
      userRecommandations: req.body.recommandationsVal
   }, {
      where: {
         user_uuid: req.user_uuid,
      },
   }).then(() => {
      res.status(200).send({
         message: "Recommandations modifiées",
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de la modification des recommandations",
      })
   });
}

exports.setUserNotifications = (req, res) => {
   if (!req.body.user_uuid) {
      res.status(400).send({
         message: "Aucun utilisateur spécifié",
      });
      return;
   }
   if (req.body.notificationsVal === undefined) {
      res.status(400).send({
         message: "Aucune valeur de notification spécifiée",
      });
      return;
   }

   User.update({
      userEmailNotifications: req.body.notificationsVal
   }, {
      where: {
         user_uuid: req.user_uuid,
      },
   }).then(() => {
      res.status(200).send({
         message: "Notifications modifiées",
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de la modification des notifications",
      })
   });
}

exports.setCity = (req, res) => {
   if (!req.body.city_id) {
      res.status(400).send({
         message: "Aucune ville spécifiée",
      });
      return;
   }
   
   User.update({
      city_id: req.body.city_id,
   }, {
      where: {
         user_uuid: req.user_uuid
      } 
   }).then(() => {
      res.status(200).send({
         message: "Ville modifiée",
      });
   }).catch(err => {
      console.error(err);
      res.status(400).send({
         message: "Erreur lors de la modification de la ville",
      })
   });
}

exports.setPreferedRadius = (req, res) => {
   if (!req.body.preferedRadius) {
      res.status(400).send({
         message: "Aucun rayon spécifié",
      });
      return;
   }

   User.update({
      preferedRadius: req.body.preferedRadius,
   }, {
      where: {
         user_uuid: req.user_uuid
      } 
   }).then(() => {
      res.status(200).send({
         message: "Rayon modifié",
      });
   }).catch(err => {
      console.error(err);
      res.status(400).send({
         message: "Erreur lors de la modification du rayon",
      })
   });
}

exports.recommandedEvents = (req, res) => {
   User.findOne({
      where: {
         user_uuid: {
            [Op.eq]: req.user_uuid
         }
      }
   }).then(user => {
      // TODO get recommended events from city_id, according to age
      res.status(200).send({
         message: "Recommandations",
      });
   }).catch(err => {
      console.error(err);
      res.status(400).send({
         message: "Erreur lors de la récupération des recommandations",
      })
   });
};

exports.getSavedEvents = (req, res) => {
   User.findOne({
      where: {
         user_uuid: {
            [Op.eq]: req.user_uuid
         }
      },
      include: [{
         model: SavedEvent,
         attributes: ["city_id", "event_id"],
      }]
   }).then(async user => {      
      res.status(200).send(
         await Promise.all(user.saved_events.map(async e => {
            const city = await City.findOne({
               where: {
                  city_id: e.city_id
               }
            });
            return fetchEvent(city, e.event_id);
         }))
      );
   }).catch(err => {
      console.error(err);
      res.status(400).send({
         message: "Impossible de récupérer les évènements enregistrés"
      })
   })
}

exports.saveEvent = (req, res) => {
   if (!req.body.event_id) {
      res.status(400).send({
         message: "Précisez un évènement à enregister",
      });
      return;
   }

   User.findOne({
      where: {
         user_uuid: {
            [Op.eq]: req.user_uuid
         }
      }
   }).then(user => {
      SavedEvent.findOne({
         where: {
            event_id: {
               [Op.eq]: req.body.event_id
            }
         }
      }).then(event => {
         if (!event) {
            SavedEvent.create({
               city_id: req.body.city_id,
               event_id: req.body.event_id,
            }).then(event => {
               user.addSaved_event(event).then(() => {
                  res.status(200).send({
                     message: "Événement sauvegardé",
                  });
               });
            }).catch(err => {
               console.error(err);
               res.status(400).send({
                  message: "Erreur lors de la sauvegarde de l'événement",
               });
            });
         } else {
            user.addSaved_event(event).then(() => {
               res.status(200).send({
                  message: "Événement sauvegardé",
               });
            });
         }
      }).catch(err => {
         console.error(err);
         res.status(400).send({
            message: "Erreur lors de l'ajout de l'évènement"
         })
      });
   }).catch(err => {
      console.error(err);
      res.status(400).send({
         message: "Erreur lors de l'ajout de l'évènement",
      });
   });
}

exports.unsaveEvent = (req, res) => {
   // TODO Supprimer le event_id de l'api spécifiée 
   if (!req.body.event_id) {
      res.status(400).send({
         message: "Requête invalide",
      });
      return;
   }

   User.findOne({
      where: {
         user_uuid: {
            [Op.eq]: req.user_uuid
         }
      }
   }).then(user => {
      SavedEvent.findOne({
         where: {
            event_id: {
               [Op.eq]: req.body.event_id
            }
         }
      }).then(event => {
         user.removeSaved_event(event).then(() => {
            res.status(200).send({
               message: "Evènement supprimé"
            });
         }).catch(err => {
            console.error(err);
            res.status(400).send({
               message: "Impossible de supprimer l'évènement"
            });
         });
      })
   })
}

exports.deleteUser = (req, res) => {
   if (!req.body.user_uuid) {
      res.status(400).send({
          message: "Requête invalide",
      });
      return;
   }

   if (req.user_uuid === req.body.user_uuid) {
      res.status(400).send({
         message: "Vous ne pouvez pas supprimer votre propre compte",
      });
      return;
   }

   User.destroy({
      where: {
         user_uuid: req.body.user_uuid
      }
   }).then(() => {
      res.status(200).send({
         message: "Utilisateur supprimé",
      });
   }).catch(err => {
      console.error(err);
      res.status(400).send({
         message: "Erreur lors de la suppression de l'utilisateur",
      });
   });
}
