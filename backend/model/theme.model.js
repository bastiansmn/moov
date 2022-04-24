module.exports = (sequelize, Sequelize) => {
   return sequelize.define('theme', {
      theme_id: {
         type: Sequelize.INTEGER,
         primaryKey: true,
         autoIncrement: true
      },
      name: {
         type: Sequelize.STRING,
         unique: true,
      },
      description: {
         type: Sequelize.STRING,
      }
   }, {
      defaultScope: {
         attributes: { exclude: ['createdAt', 'updatedAt'] },
      }
   });
}