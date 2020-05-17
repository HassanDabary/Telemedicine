const Admin = require("../models/admin.model.js");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const _ = require("lodash");

exports.create = async (req, res) => {
  if (_.isEmpty(req.body)) {
    res.status(400).send("body is empty!");
    return Error();
  }

  let hashPassword = await bcrypt.hash(req.body.password, 10);

  const admin = new Admin({
    username: req.body.username,
    password: hashPassword,
    active: 0,
  });
  Admin.create(admin, (err, results) => {
    if (err) {
      res.status(500).send(err.sqlMessage);
      return Error();
    }
    res.send(results);
  });
};

exports.login = (req, res) => {
  if (_.isEmpty(req.body)) {
    res.status(400).send("body is empty!");
    return Error();
  }

  Admin.findByUsername(req.body.username, async (err, results) => {
    if (err) {
      res.send(err).status(404);
      return Error();
    }

    let isAuthenticated = await bcrypt.compare(
      req.body.password,
      results.password
    );

    if (isAuthenticated) {
      // The secretKeyTest should not appear here
      let token = await jwt.sign({ id: results.username }, "secretKeyTest", {
        expiresIn: 86400,
      });
      res.status(200).send({ auth: true, token });
    } else {
      res.status(401).send({ auth: false, token: null });
    }
  });
};
