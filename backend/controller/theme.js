const db = require("../model/index");
const Theme = db.theme;
const ThemeState = db.themeState;
const ThemedEvent = db.themedEvent;
const Cities = db.cities;
const { fetchEvent } = require("../utils/eventFecthing");

exports.fetchThemes = async (_, res) => {
   const publicStatusID = await ThemeState.findOne({
      where: {
         name: "PUBLIC",
      },
      attributes: ["status_id"]
   });
   Theme.findAll({
      where: {
         status_id: publicStatusID.status_id,
      },
      include: [
         {
            model: db.themedEvent,
         },
         {
            model: db.themeState,
         },
         {
            model: db.user,
            attributes: ["user_uuid", "username", "email"]
         }
      ],
      attributes: {
         exclude: ["user_uuid", "status_id"]
      }
   }).then(async themes => {
      res.status(200).send(
         await Promise.all(
            themes.map(async theme => {
               const { themed_events, ...rest } = theme.dataValues;
               return {
                  themed_events: (await Promise.all(themed_events.map(async e => {
                     const city = await Cities.findOne({
                        where: {
                           city_id: e.city_id
                        }
                     });
                     return fetchEvent(city, e.event_id);
                  }))),
                  ...rest
               }
            })
         )
      );
   });
}

exports.createTheme = (req, res) => {
   if (!req.body.name || !req.body.description) {
      res.status(400).send({
         message: "Spécifiez un nom et une description"
      });
      return;
   }

   Theme.create({
      name: req.body.name,
      description: req.body.description,
      user_uuid: req.user_uuid,
   }).then(theme => {
      ThemeState.findOne({
         where: {
            name: "PRIVATE"
         }
      }).then(async themeState => {
         await theme.setTheme_state(themeState);
         Theme.findOne({
            where: {
               theme_id: theme.theme_id,
            },
            include: [
               {
                  model: db.themedEvent,
               },
               {
                  model: db.themeState,
               },
               {
                  model: db.user,
                  attributes: ["user_uuid", "username", "email"]
               }
            ],
            attributes: {
               exclude: ["user_uuid", "status_id"]
            }
         }).then(theme => {
            res.status(200).send(theme);
         })
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de la création du thème"
      });
   });
}

exports.changeStatus = (req, res) => {
   if (!req.body.theme_id || !req.body.status) {
      res.status(400).send({
         message: "Spécifiez un thème et un statut"
      });
      return;
   }
   
   if (!(db.THEME_STATUS.includes(req.body.status))) {
      res.status(400).send({
         message: "Le statut n'existe pas"
      });
      return;
   }

   Theme.findOne({
      where: {
         theme_id: req.body.theme_id,
      }
   }).then(theme => {
      // Set status as req.body.status
      ThemeState.findOne({
         where: {
            name: req.body.status
         }
      }).then(themeState => {
         theme.setTheme_state(themeState).then(async () => {
            await theme.reload({
               include: [
                  {
                     model: db.themedEvent,
                  },
                  {
                     model: db.themeState,
                  },
                  {
                     model: db.user,
                     attributes: ["user_uuid", "username", "email"]
                  }
               ],
            });
            // eslint-disable-next-line no-unused-vars
            const { status_id, updatedAt, user_uuid, ...rest } = theme.dataValues;
            res.status(200).send(rest);
         });
      });
   });
}

exports.addEvent = (req, res) => {
   if (!req.body.theme_id || !req.body.event_id) {
      res.status(400).send({
         message: "Spécifiez un thème et un évènement"
      });
      return;
   }

   Theme.findOne({
      where: {
         theme_id: req.body.theme_id,
      }
   }).then(async theme => {
      if (theme.user_uuid !== req.user_uuid) throw new Error("Vous n'êtes pas le créateur du thème");
      // Add event to theme
      if (req.body.city_id) {
         ThemedEvent.create({
            event_id: req.body.event_id,
            city_id: req.body.city_id,
         }).then(event => {
            Theme.findOne({
               where: {
                  theme_id: req.body.theme_id,
               }
            }).then(async theme => {
               await theme.addThemed_event(event);
               res.status(200).send(event);
            })
         })
      }
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de l'ajout de l'évènement"
      });
   });
}

exports.deleteEvent = (req, res) => {
   if (!req.body.theme_id || !req.body.event_id) {
      res.status(400).send({
         message: "Spécifiez un thème et un évènement"
      });
      return;
   }

   Theme.findOne({
      where: {
         theme_id: req.body.theme_id,
      },
      include: [
         {
            model: db.themedEvent,
         },
         {
            model: db.themeState,
         },
         {
            model: db.user,
            attributes: ["user_uuid", "username", "email"]
         }
      ],
      attributes: {
         exclude: ["user_uuid", "status_id"]
      }
   }).then(theme => {
      if (theme.user.user_uuid !== req.user_uuid) throw new Error("Vous n'êtes pas le créateur du thème");
      ThemedEvent.destroy({
         where: {
            event_id: req.body.event_id
         }
      }).then(() => {
         res.status(200).send({
            message: "Évènement supprimé"
         });
      }).catch(() => {
         throw new Error("Évènement introuvable");
      });
   }).catch(err => {
      console.error(err);
      res.status(500).send({
         message: "Erreur lors de la suppression de l'évènement"
      });
   });
}
