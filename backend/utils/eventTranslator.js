exports.isValidDate = (date) => {
   if (!isNaN(Date.parse(date)) && Date.now() < new Date(date).getTime())
      return date;
   return ""
}

exports.parseTags = (record, translator) => {
   const tagsMapper = {
      "Musique": [
         "musique",
         "concert",
         "album",
         "morceau",
         "music",
         "tube",
      ], 
      "Lecture": [
         "lecture",
         "bibliothèque",
         "livre",
      ],
      "Plein-air": [
         "plein-air",
         "extérieur",
         "pelouse",
         "course",
         "rubgy",
         "sport",
         "foot",
      ],
      "Cinéma": [
         "cinéma",
         "séance",
         "film",
      ],
      "Humour": [
         "humour",
         "divertissement",
      ],
      "Exposition": [
         "exposition",
         "exposé",
         "tableau",
         "visite",
         "découverte",
      ],
      "Enfants": [
         "enfants",
         "ludique",
         "jeux",
      ],
      "Spectacle": [
         "spectacle",
         "cirque",
         "tournée",
         "show",
         "mise en scène",
         "théâtre",
      ]
   }

   const res = [];
   for (const tag in tagsMapper) {
      for (const keyword of tagsMapper[tag]) {
         if (
            !res.includes(tag) &&
            (record[translator.title_field]?.toLowerCase().includes(keyword) 
            || record[translator.description_field]?.toLowerCase().includes(keyword)
         )) {
            res.push(tag);
         }
      }
   }
   return res;
}