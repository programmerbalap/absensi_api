'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');

const { DataTypes } = Sequelize;

const Absensi = db.define(
  'absensi',
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      allowNull: false,
      primaryKey: true,
    },
    uuid_karyawan: {
      type: DataTypes.STRING,
      allowNull: false,
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE',
      references: {
        model: 'karyawan',
        key: 'uuid',
      },
    },
    tanggal: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      validate: {
        notNull: {
          msg: 'Tanggal harus diisi.',
        },
      },
    },
    hadir: {
      type: DataTypes.ENUM('Hadir', 'Izin', 'Tidak Hadir'),
      defaultValue: 'Tidak Hadir',
      allowNull: true,
    },
    keterangan: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    nama_lokasi: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    time_start: {
      type: DataTypes.TIME,
      allowNull: true,
      defaultValue: null,
    },
    time_end: {
      type: DataTypes.TIME,
      allowNull: true,
      defaultValue: null,
    },
    shift: {
      type: DataTypes.ENUM('Normal', 'Lembur'),
      defaultValue: 'Normal',
      allowNull: true,
    },
    latitude: {
      type: DataTypes.DOUBLE,
      allowNull: true,
    },
    longitude: {
      type: DataTypes.DOUBLE,
      allowNull: true,
    },
    bonus: {
      type: DataTypes.BOOLEAN,
      allowNull: true,
      defaultValue: false,
    },
    nominal_bonus: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    nominal_gaji: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    kemampuan: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    jabatan: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    penjab: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    exp: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Absensi;
