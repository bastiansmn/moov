module.exports = (sequelize, Sequelize) => {
   return sequelize.define("users", {
      user_uuid: {
         type: Sequelize.UUID,
         primaryKey: true,
         unique: true
      },
      username: {
         type: Sequelize.STRING,
         unique: true
      },
      email: {
         type: Sequelize.STRING,
         unique: true
      },
      password: {
         type: Sequelize.STRING
      },
      recommandationsEnabled: {
         type: Sequelize.BOOLEAN,
         defaultValue: true,
      },
      emailNotificationEnabled: {
         type: Sequelize.BOOLEAN,
         defaultValue: false,
      },
   });
 };