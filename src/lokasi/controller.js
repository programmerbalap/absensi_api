'use strict';

const { Op } = require('sequelize');
const responseHelper = require('../../helpers/response-helper');
const Doc = require('../../models/Doc');
const Jabatan = require('../../models/Jabatan');
const Karyawan = require('../../models/Karyawan');
const Lokasi = require('../../models/Lokasi');

module.exports = {
  getAll: async (req, res) => {
    try {
      const data = await Lokasi.findAll({
        attributes: ['id', 'nama', 'latitude', 'longitude'],
      });

      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  getById: async (req, res) => {
    try {
      const data = await Lokasi.findOne({
        attributes: ['id', 'nama', 'latitude', 'longitude'],
        where: {
          id: req.params.id,
        },
      });
      data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(404).json(err.message);
    }
  },
  deleteById: async (req, res) => {
    const data = await Lokasi.findOne({
      attributes: ['id', 'nama', 'latitude', 'longitude'],
      where: { id: req.params.id },
    });
    if (data) {
      try {
        await Lokasi.destroy({
          where: { id: data.id },
        });
        responseHelper.deleted(res);
      } catch (err) {
        res.status(400).json(err.message);
      }
    } else {
      responseHelper.notFound(res);
    }
  },
  updateById: async (req, res) => {
    const { id, uuid_karyawan, nama, alamat, max_jarak, lat, lng } = req.body;
    const data = await Lokasi.findOne({
      attributes: ['uuid_karyawan'],
      where: {
        [Op.and]: [{ uuid_karyawan: uuid_karyawan }, { id: id }],
      },
    });
    if (data) {
      try {
        await Lokasi.update(
          {
            uuid_karyawan: uuid_karyawan,
            nama: nama,
            latitude: lat,
            longitude: lng,
            max_jarak: max_jarak,
            alamat: alamat,
          },
          {
            where: {
              [Op.and]: [{ uuid_karyawan: uuid_karyawan }, { id: id }],
            },
          }
        );
        responseHelper.updated(res);
      } catch (err) {
        res.status(400).json(err.message);
      }
    } else {
      responseHelper.notFound(res);
    }
  },

  // LOKASI KARYAWAN
  getAllKaryawanLokasi: async (req, res) => {
    const search = req.query.search_query || '';
    try {
      const data = await Karyawan.findAll({
        attributes: ['uuid', 'nama', 'jk'],
        where: {
          [Op.and]: [
            { status_karyawan: 'Aktif' },
            { id_jabatan: { [Op.ne]: [1] } },
            { id_jabatan: { [Op.ne]: [2] } },
            {
              [Op.or]: [
                {
                  nama: {
                    [Op.like]: '%' + search + '%',
                  },
                },
              ],
            },
          ],
        },
        include: [
          {
            model: Jabatan,
            as: 'jabatan',
            attributes: ['nama'],
          },
          {
            model: Doc,
            as: 'doc',
            attributes: ['foto'],
          },
          {
            model: Lokasi,
            as: 'lokasi',
            attributes: ['id', 'uuid_karyawan', 'nama', 'alamat', 'latitude', 'longitude', 'max_jarak', 'aktif'],
            order: [['id', 'ASC']],
          },
        ],
        order: [['createdAt', 'DESC']],
      });
      if (data) {
        const sortedData = data.map((item) => {
          const karyawanData = item.toJSON();
          karyawanData.lokasi.sort((a, b) => b.aktif - a.aktif);
          return karyawanData;
        });

        responseHelper.readAllData(res, sortedData);
      } else {
        responseHelper.notFound(res);
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  getAllLokasiByUUID: async (req, res) => {
    try {
      const data = await Lokasi.findAll({
        attributes: ['id', 'nama', 'latitude', 'longitude', 'max_jarak', 'alamat', 'aktif', 'uuid_karyawan'],
        where: {
          uuid_karyawan: req.params.uuid,
        },
        order: [['aktif', 'DESC']],
      });

      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  getLokasiById: async (req, res) => {
    try {
      const data = await Lokasi.findOne({
        attributes: ['id', 'nama', 'latitude', 'longitude', 'max_jarak', 'alamat', 'aktif', 'uuid_karyawan'],
        where: {
          id: req.params.id,
        },
      });
      data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(404).json(err.message);
    }
  },

  addLokasi: async (req, res) => {
    const { uuid, nama, lat, lng, max_jarak, alamat, aktif } = req.body;
    try {
      if (aktif == true) {
        await Lokasi.update(
          { aktif: false },
          {
            where: {
              uuid_karyawan: uuid,
            },
          }
        );
        const data = await Lokasi.create({
          uuid_karyawan: uuid,
          nama: nama,
          latitude: lat,
          longitude: lng,
          max_jarak: max_jarak,
          alamat: alamat,
          aktif: aktif,
        });
        data ? responseHelper.created(res, data) : responseHelper.notFound(res);
      } else {
        const data = await Lokasi.create({
          uuid_karyawan: uuid,
          nama: nama,
          latitude: lat,
          longitude: lng,
          max_jarak: max_jarak,
          alamat: alamat,
          aktif: aktif,
        });
        data ? responseHelper.created(res, data) : responseHelper.notFound(res);
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  setAktifById: async (req, res) => {
    const { id, uuid_karyawan } = req.body;

    const data = await Lokasi.findOne({
      attributes: ['uuid_karyawan'],
      where: {
        [Op.and]: [{ uuid_karyawan: uuid_karyawan }, { id: id }],
      },
    });
    if (data) {
      try {
        await Lokasi.update(
          {
            aktif: true,
          },
          {
            where: {
              [Op.and]: [{ uuid_karyawan: uuid_karyawan }, { id: id }],
            },
          }
        );
        await Lokasi.update(
          {
            aktif: false,
          },
          {
            where: {
              [Op.and]: [{ uuid_karyawan: uuid_karyawan }, { id: { [Op.ne]: id } }],
            },
          }
        );
        responseHelper.updated(res);
      } catch (err) {
        res.status(400).json(err.message);
      }
    } else {
      responseHelper.notFound(res);
    }
  },
};
