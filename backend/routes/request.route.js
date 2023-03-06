const { jwtAuth, verifyLog } = require("../middleware/index");
const controller = require("../controller/request");

module.exports = (app) => {
   app.use((_req, res, next) => {
      res.header(
         "Access-Control-Allow-Headers",
         "x-access-token, Origin, Content-Type, Accept"
      );
      next();
   });
   app.get(
      "/api/request/getAllRequests",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
      ],
      controller.getAllRequests
   )
}