const { verifyLog, bodytrim, requestsStats } = require("../middleware/index");
const controller = require("../controller/auth");

// Function passed to the middleware to trim the string in the body
strTrim = (str) => {
   return str.trim();
}

module.exports = (app) => {
   app.use((_req, res, next) => {
      res.header(
         "Access-Control-Allow-Headers",
         "x-access-token, Origin, Content-Type, Accept"
      );
      next();
   });
   app.post(
      "/auth/signup",
      [
         bodytrim.applyToBody(strTrim),
         verifyLog.validateEmailAndUsername,
         verifyLog.validatePassword,
         verifyLog.roleExist,
         requestsStats.saveRequest
      ],
      controller.signup
   );
   app.post(
      "/auth/signin", 
      [ 
         bodytrim.applyToBody(strTrim),
         requestsStats.saveRequest
      ], 
      controller.signin
   );
};