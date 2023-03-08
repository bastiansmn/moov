const { jwtAuth, verifyLog, bodytrim, requestsStats } = require("../middleware/index");
const controller = require("../controller/mail");

// Function passed to the middleware to trim the string in the body
const strTrim = (str) => {
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
      "/api/mail/send",
      [
         jwtAuth.verifyToken,
         verifyLog.isAdmin,
         bodytrim.applyToBody(strTrim),
         requestsStats.saveRequest
      ],
      controller.sendMail
   );
}