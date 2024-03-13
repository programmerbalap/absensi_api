'use strict';

const { Op } = require('sequelize');
const responseHelper = require('../../helpers/response-helper');
const Akses = require('../../models/Akses');
const Jabatan = require('../../models/Jabatan');
const Karyawan = require('../../models/Karyawan');
const Doc = require('../../models/Doc');

module.exports = {
  getAll: async (req, res) => {
    const search = req.query.search_query || '';
    try {
      const data = await Karyawan.findAll({
        attributes: ['uuid', 'nama', 'no_nik', 'jk', 'status_karyawan'],
        where: {
          [Op.and]: [
            { status_karyawan: 'aktif' },
            {
              [Op.or]: [
                {
                  nama: {
                    [Op.like]: '%' + search + '%',
                  },
                },
                {
                  no_nik: {
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
            model: Akses,
            as: 'akses',
            attributes: ['hk_karyawan', 'hk_lokasi', 'hk_absensi', 'hk_produksi', 'hk_produk', 'hk_shift'],
          },
          {
            model: Doc,
            as: 'doc',
            attributes: ['foto'],
          },
        ],
        order: [['createdAt', 'DESC']],
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  updateByUuid: async (req, res) => {
    const { uuid } = req.params;
    const jsn_hk_absensi = JSON.parse(req.body.hk_absensi);
    const jsn_hk_karyawan = JSON.parse(req.body.hk_karyawan);
    const jsn_hk_lokasi = JSON.parse(req.body.hk_lokasi);
    const jsn_hk_produk = JSON.parse(req.body.hk_produk);
    const jsn_hk_produksi = JSON.parse(req.body.hk_produksi);
    const jsn_hk_shift = JSON.parse(req.body.hk_shift);
    try {
      const item = await Karyawan.findOne({ where: { uuid } });
      if (!item) return res.status(404).json({ error: 'Karyawan tidak ditemukan' });

      await Akses.update(
        {
          hk_absensi: jsn_hk_absensi,
          hk_karyawan: jsn_hk_karyawan,
          hk_lokasi: jsn_hk_lokasi,
          hk_produksi: jsn_hk_produksi,
          hk_produk: jsn_hk_produk,
          hk_shift: jsn_hk_shift,
        },
        { where: { uuid_karyawan: item.uuid } }
      );
      responseHelper.updated(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  create: async (req, res) => {
    const { uuid_karyawan } = req.body;
    try {
      const data = await Akses.create({
        uuid_karyawan: uuid_karyawan,
      });
      data ? responseHelper.created(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
      console.log(err.stack);
    }
  },
};
