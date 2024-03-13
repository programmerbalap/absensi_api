'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');

const { DataTypes } = Sequelize;

const Profil = db.define(
  'profil',
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    logo: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: null,
    },
    nama_perusahaan: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Nama perusahaan tidak boleh kosong',
        },
      },
    },
    nama_alias: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Nama alias tidak boleh kosong',
        },
      },
    },
    jenis_usaha: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Jenis usaha tidak boleh kosong.',
        },
      },
    },
    profil_perusahaan: {
      type: DataTypes.TEXT,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Profil perusahaan tidak boleh kosong.',
        },
      },
    },
    pimpinan: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Nomor telepon tidak boleh kosong.',
        },
      },
    },
    nomor_telepon: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Nomor telepon tidak boleh kosong.',
        },
      },
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Email tidak boleh kosong.',
        },
      },
    },
    website: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Alamat website tidak boleh kosong.',
        },
      },
    },
    alamat: {
      type: DataTypes.TEXT,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Alamat perusahaaan tidak boleh kosong.',
        },
      },
    },
    informasi: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    lokasi: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    min_efektif_start: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Jam harus diisi.',
        },
      },
    },
    nominal_bonus: {
      type: DataTypes.FLOAT,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Nominal bonus harus diisi.',
        },
      },
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Profil;
