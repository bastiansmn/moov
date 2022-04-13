module.exports = (sequelize, Sequelize) => {
   return sequelize.define("saved_event", {
      id: {
         type: Sequelize.INTEGER,
         primaryKey: true,
         autoIncrement: true
      },
      event_id: {
         type: Sequelize.STRING
      }
   }, {
      defaultScope: {
         attributes: { exclude: ['createdAt', 'updatedAt'] },
      }
   });
};