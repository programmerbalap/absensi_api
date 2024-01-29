'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');
const { DataTypes } = Sequelize;

const Notifikasi = db.define(
  'notifikasi',
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    id_absensi: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE',
      references: {
        model: 'absensi',
        key: 'id',
      },
    },
    notif_satu: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    notif_dua: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    notif_tiga: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    notif_empat: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    notif_lima: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Notifikasi;
