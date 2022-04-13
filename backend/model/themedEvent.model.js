module.exports = (sequelize, Sequelize) => {
   return sequelize.define("themed_event", {
      id: {
         type: Sequelize.INTEGER,
         primaryKey: true,
         autoIncrement: true
      },
      dataset_id: {
         type: Sequelize.STRING
      },
      event_id: {
         type: Sequelize.STRING
      },
      blacklisted: {
         type: Sequelize.BOOLEAN
      }
   }, {
      defaultScope: {
         attributes: { exclude: ['createdAt', 'updatedAt'] },
      }
   });
};