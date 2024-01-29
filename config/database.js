const { Sequelize } = require('sequelize');

let Config;

if (process.env.NODE_ENV === 'production') {
  Config = {
    database: 'absensi_prod',
    username: 'prod_username',
    password: 'prod_password',
    host: 'prod_host',
    dialect: 'mysql',
  };
} else {
  Config = {
    database: 'absensi_dev',
    username: 'root',
    password: '',
    host: 'localhost',
    dialect: 'mysql',
  };
}

const db = new Sequelize(Config.database, Config.username, Config.password, {
  host: Config.host,
  dialect: Config.dialect,
});

module.exports = db;
