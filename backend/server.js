const express = require('express');
const bodyParser = require("body-parser");
const cors = require("cors");
require("dotenv").config();

let corsOptions = {
   origin: process.env.ORIGIN || 'http://localhost:4000',
}

const app = express();

app.use(cors(corsOptions));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Routes :
require('./routes/auth.route')(app);

const db = require("./model/index");
db.sequelize.sync()
.then(() => {
   db.role.create({
      name: "USER"
   });

   db.role.create({
      name: "ADMIN"
   });
});

app.get("/", (_req, res) => {
   res.send({
      message: "Hello World"
   })
});

console.log(process.env.JWT_SECRET);

app.listen(process.env.PORT || 3000);
