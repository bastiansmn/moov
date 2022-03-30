const { jwtAuth, verifyLog, requestsStats } = require("../middleware/index");
const controller = require("../controller/cities");

module.exports = (app) => {
   app.use((_req, res, next) => {
      res.header(
         "Access-Control-Allow-Headers",
         "x-access-token, Origin, Content-Type, Accept"
      );
      next();
   });
   app.get(
      "/cities/getCities",
      [
         requestsStats.saveRequest
      ],
      controller.getCities
   );
   app.post(
      "/cities/create",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
         requestsStats.saveRequest
      ],
      controller.createCity
   );

   app.get(
      "/cities/fetchData",
      [
         requestsStats.saveRequest
      ],
      controller.fetchData
   )
}