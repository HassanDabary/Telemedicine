module.exports = (app) => {
  const admin = require("../controllers/admin.controller.js");
  app.post("/admin", admin.create);
  app.post("/login", admin.login);
};
