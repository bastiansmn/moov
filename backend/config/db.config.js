module.exports = {
  HOST: process.env.DB_HOST || "localhost",
  USER: process.env.DB_USER || "", 
  PASSWORD: process.env.DB_PASSWORD || "",
  DB: process.env.DB_NAME || "moov",
  dialect: "postgres",
  pool: {
    max: 1000,
    min: 0,
    acquire: 10000,
    idle: 10000
  }
};