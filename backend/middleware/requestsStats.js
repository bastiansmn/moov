const db = require("../model/index");
const Request = db.request;
var jwt = require("jsonwebtoken");
const config = require("../config/auth.config.js");
const uuid = require("uuid");

saveRequest = (req, res, next) => {
   let token = req.headers["x-access-token"];
   let user_uuid;
   if (token) {
      jwt.verify(token, config.secret, (err, decoded) => {
         if (err) {
            return res.status(401).send({
               message: "Impossible de vérifier le token"
            });
         }
         user_uuid = uuid.parse(decoded.user_uuid);
      });
   }
   Request.create({
      jwt_used: token,
      user_uuid: user_uuid,
      user_agent: req.headers["user-agent"] || "unknown",
      hostname: req.headers["host"],
      date: new Date(),
      endpoint: `${req.protocol}://${req.get('host')}${req.originalUrl}`
   }).then(_r => {
      next();
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de la sauvegarde de la requête"
      });
   });
}

module.exports = {
   saveRequest,
}