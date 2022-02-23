module.exports = (sequelize, Sequelize) => {
   return sequelize.define("roles", {
      role_id: {
         type: Sequelize.INTEGER,
         primaryKey: true,
         unique: true,
         autoIncrement: true
      },
      name: {
         type: Sequelize.STRING,
         unique: true
      }
   });
};