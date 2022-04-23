const applyToBody = (fun) => {
   const apply = (obj) => {
      if (typeof obj === "string") {
         return fun(obj);
      }
      if (obj instanceof Array) {
         return obj.map(e => apply(e));
      }
      if (typeof obj === "object") {
         for (const item in obj) {
            obj[item] = apply(obj[item]);
         }
         return obj;
      }
      return obj;
   }
   return (req, _req, next) => {
      req.body = apply(req.body);
      next();
   }
}

module.exports = {
   applyToBody,
}