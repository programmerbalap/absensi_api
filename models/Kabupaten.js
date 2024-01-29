'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');

const { DataTypes } = Sequelize;

const Kabupaten = db.define(
  'kabupaten',
  {
    id: {
      type: DataTypes.STRING,
      autoIncrement: false,
      allowNull: false,
      primaryKey: true,
    },
    nama: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Kabupaten harus diisi.',
        },
      },
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Kabupaten;
