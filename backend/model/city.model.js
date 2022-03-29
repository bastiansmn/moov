module.exports = (sequelize, Sequelize) => {
   return sequelize.define("cities", {
      city_id: {
         type: Sequelize.STRING,
         primaryKey: true,
         unique: true
      },
      name: {
         type: Sequelize.STRING,
         unique: true,
         allowNull: false
      },
      api_base_link: {
         type: Sequelize.STRING
      },
      dataset_name: {
         type: Sequelize.STRING,
      },
      title_field: {
         type: Sequelize.STRING,
      },
      description_field: {
         type: Sequelize.STRING,
      },
      image_field: {
         type: Sequelize.STRING,
      },
      url_field: {
         type: Sequelize.STRING,
      },
      placename_field: {
         type: Sequelize.STRING,
      },
      timing_field: {
         type: Sequelize.STRING,
      },
      date_start_field: {
         type: Sequelize.STRING,
      },
      date_end_field: { 
         type: Sequelize.STRING,
      },
      latlon_field: {
         type: Sequelize.STRING,
      },
      city_field: {
         type: Sequelize.STRING,
      },
      district_field: {
         type: Sequelize.STRING,
      }
   }, {
      defaultScope: {
         attributes: { exclude: ['createdAt', 'updatedAt'] },
      }
   });
}