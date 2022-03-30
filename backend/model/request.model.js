module.exports = (sequelize, Sequelize) => {
   return sequelize.define("requests", {
      request_id: {
         type: Sequelize.INTEGER,
         primaryKey: true,
         autoIncrement: true,
         unique: true
      },
      jwt_used: {
         type: Sequelize.STRING,
      },
      user_agent: {
         type: Sequelize.STRING,
      },
      hostname: {
         type: Sequelize.STRING,
      },
      date: {
         type: Sequelize.DATE,
      },
      endpoint: {
         type: Sequelize.STRING,
      },
   }, {
      defaultScope: {
         attributes: { exclude: ['createdAt', 'updatedAt'] },
      }
   });
};