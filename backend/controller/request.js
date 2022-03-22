const db = require("../model/index");
const Request = db.request;


exports.getAllRequests = (_req, res) => {
   Request.findAll({
      attributes: {
         exclude: ["createdAt", "updatedAt"]
      }
   }).then(requests => {
      res.status(200).send(requests);
      return;
   }).catch(_err => {
      res.status(400).send({
         message: "Impossible de récupérer toutes les requêtes"
      });
      return;
   });
};