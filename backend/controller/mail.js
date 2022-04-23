const db = require("../model/index");
const User = db.user;
const nodemailer = require("nodemailer");
const ejs = require("ejs");
const path = require("path");

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
         userEmailNotifications: true
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
               html: result
            };
            const transporter = nodemailer.createTransport({
               service: 'gmail',
               auth: {
                  user: process.env.EMAIL,
                  pass: process.env.EMAIL_PASSWORD
               }
            });
            transporter.sendMail(mailOptions, (error) => {
               if (error) {
                  console.error(error);
                  res.status(500).send({
                     message: "Erreur lors de l'envoi du mail"
                  });
               } else {
                  res.status(200).send({
                     message: "Mail envoyé !",
                  });
               }
            });
         }).catch(err => {
            console.error(err);
            res.status(400).send({
               message: "Erreur lors du rendu du template"
            });
         });
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de la récupération des utilisateurs !"
      });
      return;
   });
}