'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');

const { DataTypes } = Sequelize;

const Akses = db.define(
  'akses',
  {
    uuid_karyawan: {
      primaryKey: true,
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
    hk_karyawan: {
      type: DataTypes.JSON,
      defaultValue: {
        edit: false,
        tambah: false,
        hapus: false,
        lihat: false,
      },
    },
    hk_lokasi: {
      type: DataTypes.JSON,
      defaultValue: {
        edit: false,
        tambah: false,
        hapus: false,
        lihat: false,
      },
    },
    hk_absensi: {
      type: DataTypes.JSON,
      defaultValue: {
        edit: false,
        tambah: false,
        hapus: false,
        lihat: false,
      },
    },
    hk_produksi: {
      type: DataTypes.JSON,
      defaultValue: {
        edit: false,
        tambah: false,
        hapus: false,
        lihat: false,
      },
    },
    hk_produk: {
      type: DataTypes.JSON,
      defaultValue: {
        edit: false,
        tambah: false,
        hapus: false,
        lihat: false,
      },
    },
    hk_shift: {
      type: DataTypes.JSON,
      defaultValue: {
        edit: false,
        tambah: false,
        hapus: false,
        lihat: false,
      },
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Akses;
