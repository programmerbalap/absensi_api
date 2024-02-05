'use strict';

const { Sequelize } = require('sequelize');
const db = require('../config/database');
const moment = require('moment/moment');
const Jabatan = require('./Jabatan');
const Kabupaten = require('./Kabupaten');
const Kemampuan = require('./Kemampuan');
const Doc = require('./Doc');
const Lokasi = require('./Lokasi');
const Absensi = require('./Absensi');
const Notifikasi = require('./Notifikasi');
const Hak_akses = require('./Hak_akses');
const Gaji = require('./Gaji');
const Produk = require('./Produk');
const Produksi = require('./Produksi');

const { DataTypes } = Sequelize;

const Karyawan = db.define(
  'karyawan',
  {
    uuid: {
      type: DataTypes.STRING,
      primaryKey: true,
      defaultValue: Sequelize.UUIDV4,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
    nama: {
      type: DataTypes.STRING,
      allowNull: false,
      isString: function (value) {
        if (typeof value !== 'string') {
          throw new Error('Nama harus berupa string.');
        }
      },
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Email harus diisi.',
        },
        isEmail: {
          msg: 'Format email tidak valid.',
        },
      },
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Password harus diisi.',
        },
        isStrongPassword: {
          args: [{ minLength: 8, minLowercase: 1, minUppercase: 1, minNumbers: 1, minSymbols: 1 }],
          msg: 'Password harus memiliki setidaknya 8 karakter, 1 huruf kecil, 1 huruf besar, 1 angka, dan 1 simbol.',
        },
      },
    },
    no_nik: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Nomor NIK harus diisi.',
        },
        len: {
          args: [16, 16],
          msg: 'Nomor NIK harus terdiri dari 16 digit.',
        },
      },
    },
    jk: {
      type: DataTypes.ENUM('Laki-laki', 'Perempuan'),
      defaultValue: 'Laki-laki',
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Jenis kelamin harus diisi.',
        },
      },
    },
    id_jabatan: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'jabatan',
        key: 'id',
      },
    },
    tmp_lhr: {
      type: DataTypes.STRING,
      allowNull: true,
      references: {
        model: 'kabupaten',
        as: 'tmp_lhr',
        key: 'id',
      },
    },
    tgl_lhr: {
      type: DataTypes.DATEONLY,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Tanggal lahir harus diisi.',
        },
        isDate: {
          msg: 'Format tanggal lahir tidak valid.',
        },
      },
      get() {
        const rawDate = this.getDataValue('tgl_lhr');
        if (rawDate) {
          return moment(rawDate).format('YYYY-MM-DD');
        }
        return null;
      },
    },
    id_kab: {
      type: DataTypes.STRING,
      allowNull: true,
      references: {
        model: 'kabupaten',
        as: 'alamat',
        key: 'id',
      },
    },
    no_telepon: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Nomor Telepon harus diisi.',
        },
        len: {
          args: [11, 13],
          msg: 'Nomor Telepon harus terdiri dari 11-13 digit.',
        },
      },
    },
    no_rekening: {
      type: DataTypes.STRING,
      allowNull: true,
      validate: {
        len: {
          args: [9, 16],
          msg: 'Nomor Rekening harus terdiri dari 16 digit.',
        },
      },
    },
    status_karyawan: {
      type: DataTypes.ENUM('Aktif', 'Non Aktif'),
      defaultValue: 'Aktif',
    },
    id_kemampuan: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'kemampuan',
        key: 'id',
      },
    },
    on: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
  },
  { freezeTableName: true }
);

Jabatan.hasMany(Karyawan, { as: 'karyawan', foreignKey: 'id_jabatan' });
Karyawan.belongsTo(Jabatan, { as: 'jabatan', foreignKey: 'id_jabatan' });

Kabupaten.hasMany(Karyawan, { as: 'karyawan', foreignKey: 'id_kab' });
Karyawan.belongsTo(Kabupaten, { as: 'alamat', foreignKey: 'id_kab' });

Kabupaten.hasMany(Karyawan, { as: 'karyawan', foreignKey: 'tmp_lhr' });
Karyawan.belongsTo(Kabupaten, { as: 'kabupaten', foreignKey: 'tmp_lhr' });

Kemampuan.hasMany(Karyawan, { as: 'karyawan', foreignKey: 'id_kemampuan' });
Karyawan.belongsTo(Kemampuan, { as: 'kemampuan', foreignKey: 'id_kemampuan' });

Karyawan.hasOne(Doc, { as: 'doc', foreignKey: 'uuid_karyawan' });
Doc.belongsTo(Karyawan, { as: 'karyawan', foreignKey: 'uuid_karyawan' });

Karyawan.hasMany(Lokasi, { as: 'lokasi', foreignKey: 'uuid_karyawan' });
Lokasi.belongsTo(Karyawan, { as: 'karyawan', foreignKey: 'uuid_karyawan' });

Karyawan.hasOne(Hak_akses, { as: 'hak_akses', foreignKey: 'uuid_karyawan' });
Hak_akses.belongsTo(Karyawan, { as: 'karyawan', foreignKey: 'uuid_karyawan' });

Karyawan.hasMany(Absensi, { as: 'absensi', foreignKey: 'uuid_karyawan' });
Absensi.belongsTo(Karyawan, { as: 'karryawan', foreignKey: 'uuid_karyawan' });

Absensi.hasOne(Notifikasi, { as: 'notifikasi', foreignKey: 'id_absensi' });
Notifikasi.belongsTo(Absensi, { as: 'absensi', foreignKey: 'id_absensi' });

Jabatan.hasMany(Gaji, { as: 'gaji', foreignKey: 'id_jabatan' });
Gaji.belongsTo(Jabatan, { as: 'jabatan', foreignKey: 'id_jabatan' });

Kemampuan.hasMany(Gaji, { as: 'gaji', foreignKey: 'id_kemampuan' });
Gaji.belongsTo(Kemampuan, { as: 'kemampuan', foreignKey: 'id_kemampuan' });

Produk.hasMany(Produksi, { as: 'produksi', foreignKey: 'id_produk' });
Produksi.belongsTo(Produk, { as: 'produk', foreignKey: 'id_produk' });

Karyawan.hasMany(Produksi, { as: 'produksi', foreignKey: 'uuid_karyawan' });
Produksi.belongsTo(Karyawan, { as: 'karyawan', foreignKey: 'uuid_karyawan' });

module.exports = Karyawan;
