const { verifyLog } = require("../middleware/index");
const controller = require("../controller/auth");

module.exports = (app) => {
   app.use((_req, res, next) => {
      res.header(
         "Access-Control-Allow-Headers",
         "x-access-token, Origin, Content-Type, Accept"
      );
      next();
   });
   app.post(
      "/api/auth/signup",
      [
         verifyLog.checkUsernameAndEmail,
         verifyLog.roleExist
      ],
      controller.signup
   );
   app.post("/api/auth/signin", controller.signin);
};