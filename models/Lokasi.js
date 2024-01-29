'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');

const { DataTypes } = Sequelize;

const Lokasi = db.define(
  'lokasi',
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    uuid_karyawan: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE',
      references: {
        model: 'karyawan',
        key: 'uuid',
      },
    },
    nama: {
      type: DataTypes.STRING,
      allowNull: true,
      isString: function (value) {
        if (typeof value !== 'string') {
          throw new Error('Nama lokasi string.');
        }
      },
    },
    alamat: {
      type: DataTypes.TEXT,
      allowNull: true,
      isString: function (value) {
        if (typeof value !== 'string') {
          throw new Error('Nama alamat string.');
        }
      },
    },
    latitude: {
      type: DataTypes.DOUBLE,
      allowNull: true,
    },
    longitude: {
      type: DataTypes.DOUBLE,
      allowNull: true,
    },
    max_jarak: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    aktif: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Lokasi;
