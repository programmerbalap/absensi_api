'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');
const Jabatan = require('./Jabatan');
const Kemampuan = require('./Kemampuan');

const { DataTypes } = Sequelize;

const Gaji = db.define(
  'gaji',
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    nominal: {
      type: DataTypes.FLOAT,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Nominal harus diisi.',
        },
      },
    },
    id_jabatan: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Jabatan harus diisi.',
        },
      },
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE',
      references: {
        model: 'jabatan',
        key: 'id',
      },
    },
    id_kemampuan: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Tingkat kemampuan harus diisi.',
        },
      },
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE',
      references: {
        model: 'kemampuan',
        key: 'id',
      },
    },
  },
  {
    freezeTableName: true,
  }
);

Jabatan.hasMany(Gaji, { foreignKey: 'id_jabatan' });
Gaji.belongsTo(Jabatan, { as: 'jabatan', foreignKey: 'id_jabatan' });
Kemampuan.hasMany(Gaji, { foreignKey: 'id_kemampuan' });
Gaji.belongsTo(Kemampuan, { as: 'kemampuan', foreignKey: 'id_kemampuan' });

module.exports = Gaji;
