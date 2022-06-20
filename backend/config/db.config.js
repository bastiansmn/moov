module.exports = {
  HOST: process.env.DB_HOST || "localhost",
  USER: process.env.DB_USER || "postgres",
  PASSWORD: process.env.DB_PASSWORD || "",
  DB: process.env.DB_NAME || "moov",
  PORT: process.env.DB_PORT || 5432,
  dialect: "postgres",
  pool: {
    max: 1000,
    min: 0,
    acquire: 10000,
    idle: 10000
  }
};
