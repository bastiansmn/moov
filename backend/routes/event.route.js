const { requestsStats } = require("../middleware/index");
const controller = require("../controller/event");

module.exports = (app) => {
   app.use((_req, res, next) => {
      res.header(
         "Access-Control-Allow-Headers",
         "x-access-token, Origin, Content-Type, Accept"
      );
      next();
   });
   app.get(
      "/api/event/fetchEvent",
      [
         requestsStats.saveRequest
      ],
      controller.fetchEvent
   )
}