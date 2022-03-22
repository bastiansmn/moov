const db = require("../model/index");
const Request = db.request;
var jwt = require("jsonwebtoken");
const config = require("../config/auth.config.js");
const uuid = require("uuid");

saveRequest = (req, res, next) => {
   let token = req.headers["x-access-token"];
   let user_uuid;
   jwt.verify(token, config.secret, (_err, decoded) => {
      user_uuid = uuid.parse(decoded.user_uuid);
   });
   Request.create({
      jwt_used: req.headers["x-access-token"] || "",
      user_uuid: user_uuid,
      user_agent: req.headers["user-agent"] || "unkown",
      hostname: req.headers["host"],
      date: new Date(),
      endpoint: `${req.protocol}://${req.get('host')}${req.originalUrl}`
   }).then(_r => {
      next();
   }).catch(_err => {
      console.log(_err);
      res.status(500).send({
         message: "Impossible de recevoir là reqûete"
      });
      return;
   });
}

module.exports = {
   saveRequest,
}