module.exports = (app) => {
  const doctor = require("../controllers/doctor.controller.js");

  app.post("/doctor", doctor.create);

  app.get("/doctor", doctor.findAll);

  app.get("/doctor/:doctorId", doctor.findOne);

  app.put("/doctor/:doctorId", doctor.update);
};
