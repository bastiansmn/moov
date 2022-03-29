module.exports = (sequelize, Sequelize) => {
   return sequelize.define("tags", {
      color: {
         type: Sequelize.STRING,
         primaryKey: true,
         unique: true
      },
      name: {
         type: Sequelize.STRING,
         allowNull: false
      }
   }, {
      defaultScope: {
         attributes: { exclude: ['createdAt', 'updatedAt'] },
      }
   });
}