const db = require("../model/index");
const User = db.user;

validateEmailAndUsername = (req, res, next) => {
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

validatePassword = (req, res, next) => {
   if (!req.body.password) {
      res.status(400).send({
         message: "Veuillez renseigner un mot de passe"
      });
      return;
   }
   if (req.body.password.length < 8 || req.body.password.length > 20) {
      res.status(400).send({
         message: "Le mot de passe doit contenir au moins 8 caractères et au plus 20 caractères"
      });
      return;
   }
   if (!req.body.password.match(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/)) {
      res.status(400).send({
         message: "Le mot de passe doit contenir uniquement des lettres et des chiffres"
      });
      return;
   }
   next();
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
   if (!req.user_uuid) {
      res.status(400).send({
         message: "Aucun utilisateur spécifié"
      });
      return;
   }
   const user_uuid = req.user_uuid;
   User.findByPk(user_uuid).then(user => {
      user.getRoles().then(roles => {
         if (roles.find(r => r.name === "ADMIN")) {
            next();
         } else {
            res.status(403).send({
               message: "Vous devez être admin"
            });
            return;
         }
      });
   }).catch(err => {
      console.error(err);
      res.status(400).send({
         message: "Une erreur est survenue"
      });
   });
};

ageIsValid = (req, res, next) => {
   if (!req.body.birthyear) {
      res.status(400).send({
         message: "Veuillez renseigner une date de naissance"
      });
      return;
   }
   if (req.body.birthyear > 2012) {
      res.status(400).send({
         message: "Vous devez avoir 10 ans minimum pour vous inscrire"
      });
      return;
   }
   next();
}

module.exports = {
   validateEmailAndUsername,
   validatePassword,
   checkRole,
   isAdmin,
   roleExist,
   ageIsValid
}
