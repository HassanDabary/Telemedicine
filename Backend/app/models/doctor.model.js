const sql = require("./db.js");

const Doctor = function (doctor) {
  this.email = doctor.email;
  this.name = doctor.name;
  this.phonenumber = doctor.phonenumber;
  this.password = doctor.password;
  this.active = 0;
};

Doctor.create = (newDoctor, result) => {
  sql.query("INSERT INTO doctor SET ?", newDoctor, (err, res) => {
    if (err) {
      result(err, null);
      return;
    }
    result(null, { id: res.insertId, ...newDoctor });
  });
};

Doctor.findById = (doctorId, result) => {
  sql.query(
    `SELECT * FROM doctor WHERE phonenumber = ${doctorId}`,
    (err, res) => {
      if (err) {
        result(err, null);
        return;
      }
      if (res.length) {
        result(null, res[0]);
        return;
      }
      result("user not found", null);
    }
  );
};

Doctor.getAll = (result) => {
  sql.query("SELECT * FROM doctor", (err, res) => {
    if (err) {
      result(err, null);
      return;
    }
    result(null, res);
  });
};

Doctor.updateById = (id, doctor, result) => {
  sql.query(
    "UPDATE doctor SET email = ?, name = ?, active = ? , password = ? WHERE id = ?",
    [doctor.email, doctor.name, doctor.active, doctor.password, id],
    (err, res) => {
      if (err) {
        result(err, null);
        return;
      }
      if (res.affectedRows == 0) {
        result("user not found", null);
        return;
      }
      result(null, { id: id, ...doctor });
    }
  );
};

module.exports = Doctor;
