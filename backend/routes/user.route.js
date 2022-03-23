const { jwtAuth, verifyLog, requestsStats } = require("../middleware/index");
const controller = require("../controller/user");

module.exports = (app) => {
   app.use((_req, res, next) => {
      res.header(
         "Access-Control-Allow-Headers",
         "x-access-token, Origin, Content-Type, Accept"
      );
      next();
   });
   app.get(
      "/user/getUserByUUID",
      [
         jwtAuth.verifyToken,
      ],
      controller.getUserByUUID
   );
   app.put(
      "/user/setNotifications",
      [
         jwtAuth.verifyToken,
         requestsStats.saveRequest
      ],
      controller.setUserNotifications
   );
   app.put(
      "/user/setRecommandations",
      [
         jwtAuth.verifyToken,
         requestsStats.saveRequest
      ],
      controller.setUserRecommandations
   ),
   
   app.get(
      "/user/getUsers",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
         requestsStats.saveRequest
      ],
      controller.getUsers
   ),
   app.put(
      "/user/updateRoles",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
         requestsStats.saveRequest
      ],
      controller.updateRoles
   );

   app.post(
      "/user/create",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
         verifyLog.validateEmailAndUsername,
         verifyLog.validatePassword,
         verifyLog.roleExist,
         requestsStats.saveRequest
      ],
      controller.createUser
   )
};