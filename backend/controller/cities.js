const db = require("../model/index");
const Cities = db.cities;

exports.getCities = (_req, res) => {
   Cities.findAll({
      exclude: ["createdAt", "updatedAt"],
   }).then(cities => {
      res.status(200).send(cities);
   }).catch(_err => {
      console.log(_err);
      res.status(400).send({
         message: "Impossible de récupérer les villes"
      });
   });
};

exports.createCity = (req, res) => {
   const city_id = req.body.city_id;
   const name = req.body.name;
   const api_base_link = req.body.api_base_link;
   const dataset_name = req.body.dataset_name;
   const title_field = req.body.title_field;
   const description_field = req.body.description_field;
   const image_field = req.body.image_field;
   const url_field = req.body.url_field;
   const placename_field = req.body.placename_field;
   const timing_field = req.body.timing_field;
   const date_start_field = req.body.date_start_field;
   const date_end_field = req.body.date_end_field;
   const latlon_field = req.body.latlon_field;
   const city_field = req.body.city_field;
   const district_field = req.body.district_field;

   if (!city_id || !name || !api_base_link || !title_field || !description_field || !image_field || !url_field || !placename_field || !timing_field || !date_start_field || !date_end_field || !city_field || !district_field || !dataset_name || !latlon_field) { 
      res.status(400).send({
         message: "Tous les champs sont requis"
      });
      return;
   }

   Cities.create({
      city_id,
      name,
      api_base_link,
      dataset_name,
      title_field,
      description_field,
      image_field,
      url_field,
      placename_field,
      timing_field,
      date_start_field,
      date_end_field,
      latlon_field,
      city_field,
      district_field
   }).then(city => {
      res.status(200).send(city);
   }).catch(_err => {
      console.log(_err);
      res.status(400).send({
         message: "Impossible de créer la ville"
      });
   });
};
