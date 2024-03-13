'use strict';

const responseHelper = require('../../helpers/response-helper');
const Karyawan = require('../../models/Karyawan');
const Absensi = require('../../models/Absensi');
const Produksi = require('../../models/Produksi');

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
    const jumlahHadir = filteredData.filter((item) => item.hadir == 'Hadir').length;
    const jumlahHari = getDaysInMonth(tahun, bulan);
    const persentases = (jumlahHadir / jumlahHari) * jumlahKaryawan;
    const persentase = persentases.toFixed(1);
    persentasePerBulan.push({ bulan, persentase });
  }
  return persentasePerBulan;
}

function hitungPersentaseProduksiPerBulan(data, tahun) {
  const persentasePerBulan = [];
  for (let bulan = 1; bulan <= 12; bulan++) {
    const filteredData = data.filter((item) => {
      const tanggal = new Date(item.tanggal);
      return tanggal.getFullYear() == tahun && tanggal.getMonth() == bulan - 1;
    });
    const jumlahProduksi = filteredData.reduce((total, item) => total + item.jumlah, 0);
    const jumlahHari = getDaysInMonth(tahun, bulan);
    const persentase = (jumlahProduksi / jumlahHari) * 100; // Menghitung persentase produksi
    persentasePerBulan.push({ bulan, persentase });
  }
  return persentasePerBulan;
}

module.exports = {
  getAll: async (req, res) => {
    const absensiData = await Absensi.findAll({
      attributes: ['id', 'tanggal', 'hadir', 'uuid_karyawan'],
      group: ['id', 'tanggal', 'uuid_karyawan'],
    });

    const dataKaryawan = await Karyawan.findAll({
      attributes: ['uuid'],
      where: {
        id_jabatan: [4, 5],
      },
    });

    const jumlahKaryaawan = dataKaryawan.length;

    const data = hitungPersentaseKehadiranPerBulan(absensiData, req.query.year, jumlahKaryaawan);
    data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
  },
  getPersentaseProduksi: async (req, res) => {
    const produksiData = await Produksi.findAll({
      attributes: ['tanggal', 'jumlah', 'jenis_produk', 'nama_produksi'],
    });
    const data = hitungPersentaseProduksiPerBulan(produksiData, req.query.year);
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
        group: ['id', 'tanggal', 'uuid_karyawan'],
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
