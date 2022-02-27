const jwt = require("jsonwebtoken");
const config = require("../config/auth.config.js");

verifyToken = (req, res, next) => {
   let token = req.headers["x-access-token"];
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
      req.userId = decoded.id;
      next();
   });
};

tokenBelongsToUser = (req, res, next) => {
   let token = req.headers["x-access-token"];
   if (!token) {
      res.status(403).send({
         message: "Aucun token renseigné"
      });
      return;
   }
   jwt.verify(token, config.secret, (err, decoded) => {
      if (err) {
         res.status(401).send({
            message: "Requête interdite"
         });
         return;
      }
      if (req.body.user_uuid && (decoded.user_uuid !== req.body.user_uuid)) {
         res.status(403).send({
            message: "Requête interdite"
         });
         return;
      }
      if (req.query.user_uuid && (decoded.user_uuid !== req.query.user_uuid)) {
         res.status(403).send({
            message: "Requête interdite"
         });
         return;
      }
      next();
   });
};

module.exports = {
   verifyToken,
   tokenBelongsToUser,
};