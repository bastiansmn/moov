const jwt = require("jsonwebtoken");
const config = require("../config/auth.config.js");

const verifyToken = (req, res, next) => {
   let token = req.headers["x-access-token"] || req.query.access_token;
   if (!token) {
      return res.status(403).send({
         message: "Aucun token renseigné"
      });
   }
   jwt.verify(token, config.secret, (err, decoded) => {
      if (err) {
         return res.status(401).send({
            message: "Requête interdite"
         });
      }
      req.user_uuid = decoded.user_uuid;
      next();
   });
};

module.exports = {
   verifyToken
};