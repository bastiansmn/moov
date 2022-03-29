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
      birthyear: {
         type: Sequelize.INTEGER
      }, 
      userRecommandations: {
         type: Sequelize.BOOLEAN,
         defaultValue: false,
      },
      userEmailNotifications: {
         type: Sequelize.BOOLEAN,
         defaultValue: false,
      },
      preferedRadius: {
         type: Sequelize.INTEGER,
         defaultValue: 25
      },
   }, {
      defaultScope: {
         attributes: { exclude: ['createdAt', 'updatedAt'] },
      }
   });
 };