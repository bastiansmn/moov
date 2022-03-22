const db = require("../model/index");
const config = require("../config/auth.config");
const User = db.user;
const Role = db.role;
const Op = db.Sequelize.Op;
var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");
const { v4: uuid } = require("uuid");

exports.signup = (req, res) => {
   // Save User to Database
   User.create({
      user_uuid: uuid(),
      username: req.body.username,
      email: req.body.email,
      password: bcrypt.hashSync(req.body.password, 8)
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
      if (req.body.roles) {
         Role.findAll({
            where: {
               name: {
                  [Op.or]: req.body.roles
               }
            }
         }).then(roles => {
            user.setRoles(roles).then(() => {
               res.status(200).send({ 
                  message: "Inscription réussie !",
                  user_uuid: user.user_uuid,
                  username: user.username,
                  email: user.email,
                  roles: authorities,
                  accessToken: token,
                  userEmailNotifications: user.emailNotificationEnabled,
                  userRecommandations: user.recommandationsEnabled
               });
            });
         });
      } else {
         // Default role = USER
         Role.findOne({
            where: {
               name: "USER"
            }
         }).then(role => {
            user.setRoles([role.role_id]).then(() => {
               res.status(200).send({ 
                  message: "Inscription réussie !",
                  user_uuid: user.user_uuid,
                  username: user.username,
                  email: user.email,
                  roles: ["USER"],
                  accessToken: token,
                  userEmailNotifications: user.emailNotificationEnabled,
                  userRecommandations: user.recommandationsEnabled
               });
            });
         });
      }
   }).catch(err => {
      res.status(500).send({ message: err.message });
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
         res.status(200).send({
            user_uuid: user.user_uuid,
            username: user.username,
            email: user.email,
            roles: authorities,
            accessToken: token,
            userEmailNotifications: user.emailNotificationEnabled,
            userRecommandations: user.recommandationsEnabled
         });
      });
   }).catch(err => {
      res.status(500).send({ message: err.message });
   });
};