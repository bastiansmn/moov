const express = require('express');
const bodyParser = require("body-parser");
const cors = require("cors");
require("dotenv").config();
const db = require("./model/index");

let corsOptions = {
   origin: process.env.ORIGIN || 'http://localhost:4000',
}

const app = express();

db.sequelize.sync()
.then(() => {
   // db.role.create({
   //    name: "USER"
   // });
   // db.role.create({
   //    name: "MODERATOR"
   // }); 
   // db.role.create({
   //    name: "ADMIN"
   // });
   // db.themeState.create({
   //    name: "PUBLIC"
   // });
   // db.themeState.create({
   //    name: "PRIVATE"
   // });
});

app.use(cors(corsOptions));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Routes :
require('./routes/auth.route')(app);
require('./routes/user.route')(app);
require('./routes/role.route')(app);
require('./routes/mail.route')(app);
require('./routes/request.route')(app);
require('./routes/cities.route')(app);
require('./routes/tags.route')(app);
require('./routes/event.route')(app);
require('./routes/theme.route')(app);

app.listen(process.env.PORT || 3000);
