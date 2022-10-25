module.exports = {
  HOST: process.env.DB_HOST || "localhost",
  USER: process.env.DB_USER || "postgres",
  PASSWORD: process.env.DB_PASSWORD || "root",
  DB: process.env.DB_NAME || "moov",
  PORT: process.env.DB_PORT || 5432,
  dialect: "postgres",
  pool: {
    acquire: 50_000,
  }
};
