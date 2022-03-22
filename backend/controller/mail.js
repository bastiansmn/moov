const db = require("../model/index");
const User = db.user;
const Op = db.Sequelize.Op;
const nodemailer = require("nodemailer");
const ejs = require("ejs");
const path = require("path");

var transporter = nodemailer.createTransport({
   service: 'gmail',
   auth: {
      user: process.env.EMAIL,
      pass: process.env.EMAIL_PASSWORD
   }
 });

exports.sendMail = (req, res) => {
   const mailSubject = req.body.mailSubject;
   const mailContent = req.body.mailContent;
   
   if (!mailSubject || !mailContent) {
      res.status(400).send({
         message: "Le sujet et le contenu du mail sont obligatoires !"
      });
      return;
   }

   User.findAll({
      where: {
         emailNotificationEnabled: {
            [Op.eq]: true
         }
      }
   }).then(users => {
      if (users.length === 0) {
         res.status(300).send({
            message: "Aucun utilisateur inscrit à la mail list"
         });
         return;
      }
      users.forEach(user => {
         ejs.renderFile(path.join(__dirname, "../views/mail.ejs"), {
            mailSubject,
            mailContent,
            username: user.username
         }).then(result => {
            console.log(result);
            var mailOptions = {
               from: 'moov.noreply@gmail.com',
               to: user.email,
               subject: mailSubject,
               html: mailContent
            };
   
            transporter.sendMail(mailOptions, (error, _info) => {
               if (error) {
                  res.status(500).send({
                     message: "Erreur lors de l'envoi du mail"
                  });
               } else {
                  res.status(200).send({
                     message: "Mail envoyé !",
                  });
               }
            });
         }).catch(_err => {
            console.error(_err);
            res.status(400).send({
               message: "Erreur lors du rendu du template"
            });
         });
      });
   }).catch(_err => {
      res.status(500).send({
         message: "Erreur lors de la récupération des utilisateurs !"
      });
      return;
   });
}