const db = require("../model/index");
const Cities = db.cities;
const fetch = (...args) => import('node-fetch').then(({default: fetch}) => fetch(...args));
const { isValidDate, parseTags } = require("../utils/eventTranslator");
const { convertLatlon } = require("../utils/eventFecthing");

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

exports.fetchData = (req, res) => {
   if (!req.query.city_id) {
      res.status(400).send({
         message: "Veuillez indiquer une ville"
      });
      return;
   }

   Cities.findOne({
      where: {
         city_id: req.query.city_id 
      },
   }).then(city => {
      if (!city) throw new Error("Ville non trouvée");
      fetch(`${city.api_base_link}/?dataset=${city.dataset_name}&rows=${req.query.rows ?? 10}&sort=${city.date_start_field}`)
         .then(response => response.json())
         .then(response => {
            res.status(200).send(response.records.map(record => {
               return {
                  city_id: city.city_id,
                  event_id: record.recordid,
                  title: record.fields[city.title_field],
                  description: record.fields[city.description_field] || "Non rensigné",
                  image: record.fields[city.image_field],
                  url: record.fields[city.url_field], 
                  placename: record.fields[city.placename_field] || "Non rensigné",
                  timing: record.fields[city.timing_field]?.replaceAll("_", " ") || "Non renseigné",
                  date_start: isValidDate(record.fields[city.date_start_field]),
                  date_end: isValidDate(record.fields[city.date_end_field]),
                  latlon: convertLatlon(record.fields[city.latlon_field]) || "Non renseigné",
                  city: record.fields[city.city_field] || "Non renseigné",
                  district: record.fields[city.district_field] || "Non renseigné",
                  tags: parseTags(record.fields, city)
               };
            }).filter(event => {
               return !("" in Object.values(event));
            }));
         })
         .catch(err => {
            console.error(err);
            res.status(400).send({
               message: "Impossible de récupérer les données"
            });
         })
   }).catch(err => {
      console.error(err);
      res.status(400).send({
         message: "Impossible de récupérer la ville"
      });
   });
}