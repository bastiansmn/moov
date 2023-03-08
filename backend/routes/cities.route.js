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
      "/api/cities/getCities",
      [
         requestsStats.saveRequest
      ],
      controller.getCities
   );
   app.get(
      "/api/cities/getAllCities",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
      ],
      controller.getAllCities
   )
   app.post(
      "/api/cities/create",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
         requestsStats.saveRequest
      ],
      controller.createCity
   );

   app.get(
      "/api/cities/fetchData",
      [
         requestsStats.saveRequest
      ],
      controller.fetchData
   );

   app.delete(
      "/api/cities/delete",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
      ],
      controller.deleteCity
   );
}