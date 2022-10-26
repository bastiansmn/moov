const express = require('express');
const bodyParser = require("body-parser");
const cors = require("cors");
require("dotenv").config();
const db = require("./model/index");

let corsOptions = {
   origin: process.env.ORIGIN ?? 'http://localhost:4000',
}

const app = express();

app.use(express.static("public"));

db.sequelize.sync()

// app.use(cors(corsOptions));
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

// Route to test the application
require('./routes/test.route')(app);

const PORT = process.env.PORT || 3000
const server = app.listen(PORT, () => {
   console.log("Server listening on port " + PORT);
});

module.exports = { app, server, db }
