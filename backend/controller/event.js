const { fetchEvent } = require("../utils/eventFetching");
const db = require("../model/index");
const City = db.cities;

exports.fetchEvent = (req, res) => {
   if (!req.query.event_id) {
      res.status(400).send({
         message: "L'id de l'événement est requis"
      });
      return;
   }
   
   if (req.query.city_id) {
      City.findOne({
         where: {
            city_id: req.query.city_id
         }
      }).then(async city => {
         res.status(200).send(await fetchEvent(city, req.query.event_id));
      }).catch(err => {
         console.error(err);
         res.status(400).send({
            message: "Impossible de récupérer les villes"
         });
      })
   } else {
      // TODO fetch api opendatasoft
      res.status(400).send({
         message: "Impossible de récupérer les villes"
      });
   }
}