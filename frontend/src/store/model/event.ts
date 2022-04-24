export default interface Event {
   city_id: string,
   event_id: string,
   title: string,
   description: string,
   image: string,
   url: string,
   placename: string,
   timing: string,
   date_start: Date,
   date_end: string,
   latlon: string,
   city: string,
   district: string,
   tags: Array<string>
}
