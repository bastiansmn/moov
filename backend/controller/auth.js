const db = require("../model/index");
const config = require("../config/auth.config");
const User = db.user;
const Role = db.role;
var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");
const { v4: uuid } = require("uuid");

exports.signup = (req, res) => {
   // Save User to Database
   User.create({
      user_uuid: uuid(),
      username: req.body.username,
      email: req.body.email,
      password: bcrypt.hashSync(req.body.password, 8),
      birthyear: req.body.birthyear,
      city_id: "paris",
   }).then(user => {
      var authorities = [];
      user.getRoles().then(roles => {
         roles.forEach(r => {
            authorities.push(r.name.toUpperCase());
         });
      });
      var token = jwt.sign({ user_uuid: user.user_uuid }, config.secret, {
         expiresIn: 3600 * 24 * 31 // 1 Month
      });
      // Default role = USER
      Role.findOne({
         where: {
            name: "USER"
         }
      }).then(role => {
         user.setRoles([role.role_id]).then(() => {
            // eslint-disable-next-line no-unused-vars
            const { password, ...u } = user.dataValues;
            res.status(200).send({ 
               message: "Inscription réussie !",
               ...u,
               accessToken: token,
               roles: ["USER"],
            });
         });
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({ 
         message: "Erreur lors de l'inscription"
      });
   });
};

exports.signin = (req, res) => {
   User.findOne({
      where: {
         username: req.body.username
      }
   }).then(user => {
      if (!user) {
         return res.status(400).send({
            message: "Utilisateur inconnu" 
         });
      }
      var passwordIsValid = bcrypt.compareSync(
         req.body.password,
         user.password
      );
      if (!passwordIsValid) {
         return res.status(401).send({
            accessToken: null,
            message: "Le mot de passe est incorrect"
         });
      }
      var token = jwt.sign({ user_uuid: user.user_uuid }, config.secret, {
         expiresIn: 3600 * 24 * 31 // 1 Month
      });
      var authorities = [];
      user.getRoles().then(roles => {
         roles.forEach(r => {
            authorities.push(r.name.toUpperCase());
         });
         // eslint-disable-next-line no-unused-vars
         const { password, ...u } = user.dataValues;
         res.status(200).send({
            ...u,
            roles: authorities,
            accessToken: token,
         });
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({ 
         message: "Erreur lors de la connexion"
      });
   });
};