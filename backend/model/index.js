const config = require("../config/db.config.js");
const Sequelize = require("sequelize");

const sequelize = new Sequelize(
  config.DB,
  config.USER,
  config.PASSWORD,
  {
    logging: false,
    host: config.HOST,
    port: config.PORT,
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
  theme: require("./theme.model")(sequelize, Sequelize),
  themeState: require("./themeState.model")(sequelize, Sequelize),
  themedEvent: require("./themedEvent.model")(sequelize, Sequelize),
  savedEvent: require("./savedEvent.model")(sequelize, Sequelize),
  // ... other models


  // Utils/enums/...
  ROLES: ["USER", "MODERATOR", "ADMIN"],
  THEME_STATUS: ["PUBLIC", "PRIVATE"],
  TAGS: ["Musique", "Lecture", "Plein-air", "Cinéma", "Humour", "Exposition", "Enfants", "Spectacle"],
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
db.user.hasOne(db.theme, {
  foreignKey: "user_uuid"
});
db.theme.belongsToMany(db.themedEvent, {
  through: "link_theme_events",
  foreignKey: "theme_id",
  otherKey: "id"
});
db.themedEvent.belongsToMany(db.theme, {
  through: "link_theme_events",
  foreignKey: "id",
  otherKey: "theme_id"
});
db.themeState.hasMany(db.theme, {
  foreignKey: "status_id"
});
db.savedEvent.belongsToMany(db.user, {
  through: "link_saved_user",
  foreignKey: "id",
  otherKey: "user_uuid"
});
db.user.belongsToMany(db.savedEvent, {
  through: "link_saved_user",
  foreignKey: "user_uuid",
  otherKey: "id"
});
db.cities.hasOne(db.savedEvent, {
  foreignKey: "city_id"
});

module.exports = db;
