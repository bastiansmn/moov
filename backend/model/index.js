const config = require("../config/db.config.js");
const Sequelize = require("sequelize");

const sequelize = new Sequelize(
  config.DB,
  config.USER,
  config.PASSWORD,
  {
    logging: false,
    host: config.HOST,
    dialect: config.dialect,
    pool: {
      max: config.pool.max,
      min: config.pool.min,
      acquire: config.pool.acquire,
      idle: config.pool.idle
    }
  }
);

const db = {
  Sequelize: Sequelize,
  sequelize: sequelize,
  
  user: require("./user.model")(sequelize, Sequelize),
  role: require("./role.model")(sequelize, Sequelize),
  request: require("./request.model")(sequelize, Sequelize),
  cities: require("./city.model")(sequelize, Sequelize),
  tags: require("./tags.model")(sequelize, Sequelize),
  // ... other models


  // Utils/enums/...
  ROLES: ["USER", "MODERATOR", "ADMIN"],
};

// Associations
db.role.belongsToMany(db.user, {
  through: "link_user_roles",
  foreignKey: "role_id",
  otherKey: "user_uuid"
});
db.user.belongsToMany(db.role, {
  through: "link_user_roles",
  foreignKey: "user_uuid",
  otherKey: "role_id"
});
db.user.hasMany(db.request, {
  foreignKey: "user_uuid"
});
db.cities.hasOne(db.user, {
  foreignKey: "city_id"
});


module.exports = db;