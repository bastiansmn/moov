const db = require("../model/index");
const Role = db.role;

exports.getAllRoles = (_req, res) => {
   Role.findAll({
      attributes: ["name", "role_id"]
   }).then(roles => {
      res.status(200).send(roles);
   });
}
