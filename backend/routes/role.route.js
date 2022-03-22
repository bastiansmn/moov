const { verifyLog, jwtAuth } = require("../middleware/index");
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
      "/role/getAllRoles",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin
      ],
      controller.getAllRoles
   )
}