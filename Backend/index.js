const express = require("express");
const bodyParser = require("body-parser");

const app = express();

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.json({ message: "Telemedicine API" });
});
require("./app/routes/doctor.routes.js")(app);
require("./app/routes/admin.routes.js")(app);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`127.0.0.1:${PORT}.`);
});
