const db = require("../model/index");
const Theme = db.theme;
const ThemeState = db.themeState;
const ThemedEvent = db.themedEvent;
const Cities = db.cities;
const { fetchEvent } = require("../utils/eventFetching");

exports.fetchThemes = async (req, res) => {
   if (!req.query.city_id) {
      res.status(400).send({
         message: "Spécifiez une ville"
      });
      return;
   }
   const publicStatusID = await ThemeState.findOne({
      where: {
         name: "PUBLIC",
      },
      attributes: ["status_id"]
   });
   if (!publicStatusID) {
      res.status(500).send({
         message: "Impossible de récupérer les thèmes"
      });
      return;
   }
   Theme.findAll({
      where: {
         status_id: publicStatusID.status_id,
         city_id: req.query.city_id,
      },
      include: [
         {
            model: db.themedEvent,
         },
         {
            model: db.themeState,
         },
         {
            model: db.user,
            attributes: ["user_uuid", "username", "email"]
         }
      ],
      attributes: {
         exclude: ["user_uuid", "status_id"]
      }
   }).then(async themes => {
      const city = await Cities.findOne({
         where: {
            city_id: req.query.city_id
         }
      });
      res.status(200).send(
         await Promise.all(
            themes.map(async theme => {
               const { themed_events, ...rest } = theme.dataValues;
               return {
                  themed_events: (await Promise.all(themed_events.map(async e => {
                     return fetchEvent(city, e.event_id);
                  }))).filter(e => e !== null),
                  ...rest
               }
            })
         )
      );
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Impossible de récupérer les thèmes"
      });
   });
}

exports.fetchPendingThemes = async (req, res) => {
   const privateStatusID = await ThemeState.findOne({
      where: {
         name: "PRIVATE",
      },
      attributes: ["status_id"]
   });
   Theme.findAll({
      where: {
         status_id: privateStatusID.status_id,
      },
      include: [
         {
            model: db.themedEvent,
         },
         {
            model: db.themeState,
         },
         {
            model: db.user,
            attributes: ["user_uuid", "username", "email"]
         }
      ],
      attributes: {
         exclude: ["user_uuid", "status_id"]
      }
   }).then(async themes => {
      res.status(200).send(
         await Promise.all(
            themes.map(async theme => {
               const { themed_events, ...rest } = theme.dataValues;
               const city = await Cities.findOne({
                  where: {
                     city_id: theme.dataValues.city_id
                  }
               });
               return {
                  themed_events: (await Promise.all(themed_events.map(async e => {
                     return fetchEvent(city, e.event_id);
                  }))),
                  ...rest
               }
            })
         )
      );
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Impossible de récupérer les thèmes"
      });
   });
}

exports.createTheme = (req, res) => {
   if (!req.body.name || !req.body.description) {
      res.status(400).send({
         message: "Spécifiez un nom et une description"
      });
      return;
   }

   Theme.create({
      name: req.body.name,
      description: req.body.description,
      user_uuid: req.user_uuid,
      city_id: req.body.city_id || null,
   }).then(theme => {
      ThemeState.findOne({
         where: {
            name: "PRIVATE"
         }
      }).then(async themeState => {
         await theme.setTheme_state(themeState);
         Theme.findOne({
            where: {
               theme_id: theme.theme_id,
            },
            include: [
               {
                  model: db.themedEvent,
               },
               {
                  model: db.themeState,
               },
               {
                  model: db.user,
                  attributes: ["user_uuid", "username", "email"]
               }
            ],
            attributes: {
               exclude: ["user_uuid", "status_id"]
            }
         }).then(theme => {
            res.status(200).send(theme);
         })
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de la création du thème"
      });
   });
}

exports.deleteTheme = (req, res) => {
   Theme.destroy({
      where: {
         theme_id: req.body.theme_id
      }
   }).then(theme => {
      if (!theme) {
         res.status(404).send({
            message: "Theme non trouvé"
         });
         return;
      }
      res.status(200).send({
         message: "Thème supprimé"
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Impossible de supprimer le thème"
      });
   });
}

exports.changeStatus = (req, res) => {
   if (!req.body.theme_id || !req.body.status) {
      res.status(400).send({
         message: "Spécifiez un thème et un statut"
      });
      return;
   }
   
   if (!(db.THEME_STATUS.includes(req.body.status))) {
      res.status(400).send({
         message: "Le statut n'existe pas"
      });
      return;
   }

   Theme.findOne({
      where: {
         theme_id: req.body.theme_id,
      }
   }).then(theme => {
      // Set status as req.body.status
      if (!theme) throw new Error("Le thème n'existe pas");
      ThemeState.findOne({
         where: {
            name: req.body.status
         }
      }).then(themeState => {
         theme.setTheme_state(themeState).then(async () => {
            await theme.reload({
               include: [
                  {
                     model: db.themedEvent,
                  },
                  {
                     model: db.themeState,
                  },
                  {
                     model: db.user,
                     attributes: ["user_uuid", "username", "email"]
                  }
               ],
            });
            // eslint-disable-next-line no-unused-vars
            const { status_id, updatedAt, user_uuid, ...rest } = theme.dataValues;
            res.status(200).send(rest);
         });
      }).catch(err => {
         throw new Error(err);
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de la modification du statut"
      });
   });
}

exports.addEvent = (req, res) => {
   if (!req.body.theme_id || !req.body.event_id) {
      res.status(400).send({
         message: "Spécifiez un thème et un évènement"
      });
      return;
   }

   Theme.findOne({
      where: {
         theme_id: req.body.theme_id,
      }
   }).then(async theme => {
      if (theme.user_uuid !== req.user_uuid) throw new Error("Vous n'êtes pas le créateur du thème");
      // Add event to theme
      ThemedEvent.create({
         event_id: req.body.event_id
      }).then(event => {
         Theme.findOne({
            where: {
               theme_id: req.body.theme_id,
            }
         }).then(async theme => {
            await theme.addThemed_event(event);
            // eslint-disable-next-line no-unused-vars
            const { updatedAt, createdAt, ...rest } = event.dataValues;
            res.status(200).send(rest);
         })
      })
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de l'ajout de l'évènement"
      });
   });
}

exports.deleteEvent = (req, res) => {
   if (!req.body.theme_id || !req.body.event_id) {
      res.status(400).send({
         message: "Spécifiez un thème et un évènement"
      });
      return;
   }

   Theme.findOne({
      where: {
         theme_id: req.body.theme_id,
      },
      include: [
         {
            model: db.themedEvent,
         },
         {
            model: db.themeState,
         },
         {
            model: db.user,
            attributes: ["user_uuid", "username", "email"]
         }
      ],
      attributes: {
         exclude: ["user_uuid", "status_id"]
      }
   }).then(theme => {
      if (theme.user.user_uuid !== req.user_uuid) throw new Error("Vous n'êtes pas le créateur du thème");
      ThemedEvent.destroy({
         where: {
            event_id: req.body.event_id
         }
      }).then(() => {
         res.status(200).send({
            message: "Évènement supprimé"
         });
      }).catch(() => {
         throw new Error("Évènement introuvable");
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de la suppression de l'évènement"
      });
   });
}
