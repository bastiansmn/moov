const fetch = (...args) => import('node-fetch').then(({default: fetch}) => fetch(...args));
const { parseTags } = require("../utils/eventTranslator");

exports.convertLatlon = (latlon) => {
   if (Array.isArray(latlon)) {
      return {
         lat: latlon[0],
         lng: latlon[1]
      }
   }
   return {
      lat: latlon.lat,
      lng: latlon.lng ?? latlon.lon
   }
}

exports.fetchEvent = (city, event_id) => {
   return new Promise(resolve => {
      shortenApiLink = city.api_base_link.match(/^(https?:\/\/([a-z0-9-]+\.?)+[a-z]+)/)[1];
      fetch(`${shortenApiLink}/api/v2/catalog/datasets/${city.dataset_name}/records/${event_id}`)
         .then(response => response.json())
         .then(response => {
            resolve({
               city_id: city.city_id,
               event_id: event_id,
               title: response.record.fields[city.title_field],
               description: response.record.fields[city.description_field],
               image: response.record.fields[city.image_field],
               url: response.record.fields[city.url_field],
               placename: response.record.fields[city.placename_field],
               timing: response.record.fields[city.timing_field],
               date_start: response.record.fields[city.date_start_field],
               date_end: response.record.fields[city.date_end_field],
               latlon: this.convertLatlon(response.record.fields[city.latlon_field]),
               city: response.record.fields[city.city_field],
               district: response.record.fields[city.district_field],
               tags: parseTags(response.record.fields, city)
            });
         })
         .catch(err => {
            console.error(err);
            resolve(null);
         })
   })
}
