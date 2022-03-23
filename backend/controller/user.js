const db = require("../model/index");
const User = db.user;
const Role = db.role;
const Op = db.Sequelize.Op;
var jwt = require("jsonwebtoken");
const config = require("../config/auth.config");
const { v4: uuid } = require("uuid");
var bcrypt = require("bcryptjs");

exports.getUsers = async (_req, res) => {
   User.findAll({
      include: [{
         model: Role,
         attributes: ["name"],
      }],
      attributes: ["user_uuid", "username", "email", "emailNotificationEnabled", "recommandationsEnabled"]
   }).then(users => {
      res.status(200).send(users.map(u => ({
         ...u.dataValues,
         roles: u.roles.map(r => r.name)
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

   if (!username || !email || !password || !roles) {
      res.status(400).send({
         message: "Tous les champs sont requis"
      });
      return;
   }

   User.create({
      user_uuid: uuid(),
      username: req.body.username,
      email: req.body.email,
      password: bcrypt.hashSync(req.body.password, 8)
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
      res.status(200).send({
         user_uuid: user.user_uuid,
         username: user.username,
         email: user.email,
         roles: roles.filter(r => r === "USER" || r === "MODERATOR" || r === "ADMIN"),
         recommandationsEnabled: user.recommandationsEnabled,
         emailNotificationEnabled: user.emailNotificationEnabled
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
      var token = jwt.sign({ user_uuid: user.user_uuid }, config.secret, {
         expiresIn: 3600 * 24 * 31 // 1 Month
      });
      user.getRoles().then(r => {
         var authorities = [];
         r.forEach(role => {
            authorities.push(role.name.toUpperCase());
         });
         res.status(200).send({
            user_uuid: user.user_uuid,
            username: user.username,
            email: user.email,
            roles: authorities,
            accessToken: token,
            userEmailNotifications: user.emailNotificationEnabled,
            userRecommandations: user.recommandationsEnabled
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

   User.findOne({
      where: {
         user_uuid: req.body.user_uuid,
      },
   }).then(user => {
      user.recommandationsEnabled = req.body.recommandationsVal;
      user.save().then(() => {
         res.status(200).send({
            message: "Recommandations modifiées",
         });
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

   User.findOne({
      where: {
         user_uuid: req.body.user_uuid,
      },
   }).then(user => {
      user.emailNotificationEnabled = req.body.notificationsVal;
      user.save().then(() => {
         res.status(200).send({
            message: "Notifications modifiées",
         });
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de la modification des notifications",
      })
   });
}