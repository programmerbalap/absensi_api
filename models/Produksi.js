'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');

const { DataTypes } = Sequelize;

const Produksi = db.define(
  'produksi',
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
          msg: 'Nama barang harus diisi.',
        },
      },
    },
    jumlah: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Jumlah barang harus diisi.',
        },
      },
    },
    uuid_karyawan: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Gaji harus diisi.',
        },
      },
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
      defaultValue: Sequelize.literal("CONVERT_TZ(CURRENT_DATE(), '+00:00', '+07:00')"),
      validate: {
        notNull: {
          msg: 'Tanggal harus diisi.',
        },
      },
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Produksi;
