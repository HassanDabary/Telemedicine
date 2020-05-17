const sql = require("./db.js");

const Admin = function (admin) {
  this.username = admin.username;
  this.password = admin.password;
  this.active = 0;
};

Admin.create = (newAdmin, result) => {
  sql.query("INSERT INTO admin SET ?", newAdmin, (err, res) => {
    if (err) {
      result(err, null);
      return;
    }

    result(null, { id: res.insertId, ...newAdmin });
  });
};

Admin.findByUsername = (adminUsername, results) => {
  sql.query(
    `SELECT * FROM admin WHERE username = "${adminUsername}"`,
    (err, res) => {
      if (err) {
        results(err, null);
        return;
      }
      if (res.length) {
        results(null, res[0]);
        return;
      }
      results("user not found", null);
    }
  );
};

module.exports = Admin;
