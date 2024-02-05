'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');

const { DataTypes } = Sequelize;

const Doc = db.define(
  'doc',
  {
    uuid_karyawan: {
      primaryKey: true,
      type: DataTypes.STRING,
      allowNull: true,
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE',
      references: {
        model: 'karyawan',
        key: 'uuid',
      },
    },
    foto: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: null,
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Doc;
