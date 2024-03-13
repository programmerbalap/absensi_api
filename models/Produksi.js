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
    id_produk: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Jenis produk harus diisi.',
        },
      },
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE',
      references: {
        model: 'produk',
        key: 'id',
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
    kualitas: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: false,
    },
    setujui: {
      type: DataTypes.BOOLEAN,
      allowNull: true,
      defaultValue: false,
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
  },
  {
    freezeTableName: true,
  }
);

module.exports = Produksi;
