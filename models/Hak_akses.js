'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');

const { DataTypes } = Sequelize;

const Hak_akses = db.define(
  'hak_akses',
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
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
    hk_gaji: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    hk_absensi: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    hk_kemampuan: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    hk_keterlambatan: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    hk_notifikasi: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    hk_hak_akses: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    hk_jabatan: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    hk_bonus: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    hk_produksi: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    hk_karyawan: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Hak_akses;
