'use strict';

const responseHelper = require('../../helpers/response-helper');
const Karyawan = require('../../models/Karyawan');
const Absensi = require('../../models/Absensi');
const { Op } = require('sequelize');

function getDaysInMonth(year, month) {
  return new Date(year, month, 0).getDate();
}

function hitungPersentaseKehadiranPerBulan(data, tahun, jumlahKaryawan) {
  const persentasePerBulan = [];
  for (let bulan = 1; bulan <= 12; bulan++) {
    const filteredData = data.filter((item) => {
      const tanggal = new Date(item.tanggal);
      return tanggal.getFullYear() == tahun && tanggal.getMonth() == bulan - 1;
    });
    const jumlahHadir = filteredData.filter((item) => item.hadir === true).length;
    const jumlahHari = getDaysInMonth(tahun, bulan);
    const persentases = (jumlahHadir / jumlahHari) * jumlahKaryawan;
    const persentase = persentases.toFixed(1);
    persentasePerBulan.push({ bulan, persentase });
  }
  return persentasePerBulan;
}

module.exports = {
  getAll: async (req, res) => {
    const absensiData = await Absensi.findAll({
      attributes: ['id', 'tanggal', 'hadir', 'uuid_karyawan'],
      group: ['tanggal', 'uuid_karyawan'],
    });

    const dataKaryawan = await Karyawan.findAll({
      attributes: ['uuid'],
      where: {
        [Op.or]: [
          {
            id_jabatan: 4,
          },
        ],
      },
    });

    const jumlahKaryaawan = dataKaryawan.length;

    const data = hitungPersentaseKehadiranPerBulan(absensiData, req.query.year, jumlahKaryaawan);
    data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
  },

  getPresentaseHariIni: async (req, res) => {
    const tanggal = new Date(`${req.params.hari_ini}T00:00:00Z`);
    try {
      const data = await Absensi.findAll({
        attributes: ['tanggal', 'hadir', 'uuid_karyawan', 'id'],
        where: {
          tanggal: tanggal,
        },
        group: ['tanggal', 'uuid_karyawan'],
      });

      const jumlahHadir = data.filter((item) => item.hadir === 'Hadir').length;
      const jumlahTidak = data.filter((item) => item.hadir === 'Tidak Hadir').length;
      const jumlahIzin = data.filter((item) => item.hadir === 'Izin').length;

      const data_ = { hadir: jumlahHadir, tidak_hadir: jumlahTidak, izin: jumlahIzin };

      data ? responseHelper.readAllData(res, data_) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
};
