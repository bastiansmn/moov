const { jwtAuth } = require("../middleware/index");
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
         jwtAuth.tokenBelongsToUser,
      ],
      controller.getUserByUUID
   );
   app.put(
      "/user/setNotifications",
      [
         jwtAuth.verifyToken,
         jwtAuth.tokenBelongsToUser,
      ],
      controller.setUserNotifications
   );
   app.put(
      "/user/setRecommandations",
      [
         jwtAuth.verifyToken,
         jwtAuth.tokenBelongsToUser,
      ],
      controller.setUserRecommandations
   )
};