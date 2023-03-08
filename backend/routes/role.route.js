const { verifyLog, jwtAuth, requestsStats } = require("../middleware");
const controller = require("../controller/role");

module.exports = (app) => {
   app.use((_req, res, next) => {
      res.header(
         "Access-Control-Allow-Headers",
         "x-access-token, Origin, Content-Type, Accept"
      );
      next();
   });
   app.get(
      "/api/role/getAllRoles",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
         requestsStats.saveRequest
      ],
      controller.getAllRoles
   )
}