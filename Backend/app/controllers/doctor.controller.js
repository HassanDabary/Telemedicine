const Doctor = require("../models/doctor.model.js");
const bcrypt = require("bcryptjs");
const _ = require("lodash");
exports.create = async (req, res) => {
  if (_.isEmpty(req.body)) {
    res.status(400).send("body is empty!");
    return Error();
  }

  let hashPassword = await bcrypt.hash(req.body.password, 10);

  const doctor = new Doctor({
    email: req.body.email,
    name: req.body.name,
    phonenumber: req.body.phonenumber,
    password: hashPassword,
    active: 0,
  });

  Doctor.create(doctor, (err, results) => {
    if (err) {
      res.status(500).send(err.sqlMessage);
      return Error();
    }
    res.send(results);
  });
};

exports.findAll = (req, res) => {
  Doctor.getAll((err, results) => {
    if (err) {
      res.status(500).send(err.sqlMessage);
      return Error();
    }
    res.send(results);
  });
};

exports.findOne = (req, res) => {
  Doctor.findById(req.params.doctorId, (err, results) => {
    if (err) {
      res.send(err).status(404);
      return Error();
    }
    res.send(results);
  });
};

exports.update = (req, res) => {
  if (_.isEmpty(req.body)) {
    res.status(400).send("body is empty!");
    return Error();
  }

  Doctor.updateById(
    req.params.doctorId,
    new Doctor(req.body),
    (err, results) => {
      if (err) {
        res.send(err).status(404);
        return Error();
      }
      res.send(results);
    }
  );
};
