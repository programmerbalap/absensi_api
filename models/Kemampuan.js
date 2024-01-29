'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');

const { DataTypes } = Sequelize;

const Kemampuan = db.define(
  'kemampuan',
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    nama: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Kemampuan harus diisi.',
        },
      },
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Kemampuan;
