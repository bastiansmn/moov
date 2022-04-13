const db = require("../model/index");

exports.getTags = (req, res) => {
   res.status(200).send(db.TAGS);
}