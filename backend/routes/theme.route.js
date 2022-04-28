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
      "/theme/fetchThemes", 
      controller.fetchThemes
   );
   app.get(
      "/theme/fetchPendingThemes",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin
      ],
      controller.fetchPendingThemes
   );
   app.post(
      "/theme/createTheme",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdminOrModerator,
         requestsStats.saveRequest
      ],
      controller.createTheme
   );
   app.put(
      "/theme/changeStatus",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
      ],
      controller.changeStatus
   );
   app.post(
      "/theme/addEvent",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdminOrModerator,
      ],
      controller.addEvent
   );
   app.delete(
      "/theme/deleteEvent",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdminOrModerator, 
      ],
      controller.deleteEvent
   );
}