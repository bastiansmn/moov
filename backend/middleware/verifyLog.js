const db = require("../model/index");
const User = db.user;

checkUsernameAndEmail = (req, res, next) => {
   if (!req.body.username || !req.body.email) {
      res.status(400).send({
         message: "Veuillez renseigner un nom d'utilisateur et un email"
      });
      return;
   }
   if (!req.body.email.match(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/)) {
      res.status(400).send({
         message: "Email non valide"
      });
      return;
   }
   if (req.body.username.match(/^[a-zA-Z0-9]$/)) {
      res.status(400).send({
         message: "Pseudo non valide"
      });
      return;
   }
   User.findOne({
      where: {
         username: req.body.username,
      }
   }).then(user => {
      if (user) {
         res.status(400).send({
            message: "Ce nom d'utilisateur est déjà utilisé"
         });
         return;
      }
      
      User.findOne({
         where: {
            email: req.body.email,
         },
      }).then(user => {
         if (user) {
            res.status(400).send({
               message: "Cet email est déjà utilisé"
            });
            return;
         }
         
         next();
      });
   });
};

checkRole = (req, res, next) => {
   if (!req.body.role) {
      res.status(400).send({
         message: "Aucun rôle n'as été renseigné pour la requête"
      });
      return;
   }
   next();
};

roleExist = (req, res, next) => {
   if (!req.body.role) 
      return next();
   if (!db.ROLES.includes(req.body.role)) {
      res.status(400).send({
         message: `Le rôle ${req.body.role} n'existe pas`
      });
      return;
   }
   next();
};

isAdmin = (req, res, next) => {
   User.findByPk(req.userId).then(user => {
      user.getRoles().then(roles => {
         roles.forEach(r => {
            if (r.name === "ADMIN") {
               next();
               return;
            }
         });
         res.status(403).send({
            message: "Vous devez être administrateur pour effectuer cette action"
         });
         return;
      });
   });
};

module.exports = {
   checkUsernameAndEmail,
   checkRole,
   isAdmin,
   roleExist
}
