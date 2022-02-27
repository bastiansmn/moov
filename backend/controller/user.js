const db = require("../model/index");
const User = db.user;
const Op = db.Sequelize.Op;

exports.getUserByUUID = (req, res) => {
   User.findOne({
      where: {
         user_uuid: {
            [Op.eq]: req.query.user_uuid,
         }
      }
   }).then(user => {
      // TODO : Ajouter les rôles
      res.status(200).send(user);
   }).catch(_err => {
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
   }).catch(_err => {
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
   }).catch(_err => {
      res.status(500).send({
         message: "Erreur lors de la modification des notifications",
      })
   });
}