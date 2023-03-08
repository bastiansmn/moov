const controller = require("../controller/theme");
const { verifyLog, jwtAuth, requestsStats } = require("../middleware");

module.exports = (app) => {
   app.use((_, res, next) => {
      res.header(
         "Access-Control-Allow-Headers",
         "x-access-token, Origin, Content-Type, Accept"
      );
      next();
   });
   app.get(
      "/api/theme/fetchThemes",
      controller.fetchThemes
   );
   app.get(
      "/api/theme/fetchPendingThemes",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin
      ],
      controller.fetchPendingThemes
   );
   app.post(
      "/api/theme/createTheme",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdminOrModerator,
         requestsStats.saveRequest
      ],
      controller.createTheme
   );
   app.delete(
      "/api/theme/deleteTheme",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdminOrModerator,
         requestsStats.saveRequest
      ],
      controller.deleteTheme
   )
   app.put(
      "/api/theme/changeStatus",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
      ],
      controller.changeStatus
   );
   app.post(
      "/api/theme/addEvent",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdminOrModerator,
      ],
      controller.addEvent
   );
   app.delete(
      "/api/theme/deleteEvent",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdminOrModerator, 
      ],
      controller.deleteEvent
   );
}