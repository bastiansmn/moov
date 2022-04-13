module.exports = (sequelize, Sequelize) => {
   return sequelize.define("theme_state", {
      status_id: {
         type: Sequelize.INTEGER,
         primaryKey: true,
         unique: true,
         autoIncrement: true
      },
      name: {
         type: Sequelize.STRING,
         unique: true
      }
   }, {
      defaultScope: {
         attributes: { exclude: ['createdAt', 'updatedAt'] },
      }
   });
};