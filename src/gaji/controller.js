'use strict';

const responseHelper = require('../../helpers/response-helper');
const Gaji = require('../../models/Gaji');
const Karyawan = require('../../models/Karyawan');
const Doc = require('../../models/Doc');
const Jabatan = require('../../models/Jabatan');
const Kemampuan = require('../../models/Kemampuan');
const { Op, Sequelize } = require('sequelize');

module.exports = {
  getInformasiPenggajian: async (req, res) => {
    const search = req.query.search_query || '';
    try {
      const data = await Karyawan.findAll({
        attributes: [
          'uuid',
          'nama',
          'email',
          'no_nik',
          'jk',
          [
            Sequelize.literal(`(
              SELECT g.nominal
              FROM gaji AS g
              WHERE g.id_jabatan = karyawan.id_jabatan
              AND g.id_kemampuan = karyawan.id_kemampuan
           )`),
            'gaji',
          ],
          [
            Sequelize.literal(`(
              SELECT s.nominal_bonus
              FROM statis AS s
              WHERE s.aktif = true
           )`),
            'gaji_bonus',
          ],
        ],
        where: {
          [Op.and]: [
            { status_karyawan: 'aktif' },
            { id_jabatan: { [Op.ne]: [1] } },
            { id_jabatan: { [Op.ne]: [2] } },
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
            model: Kemampuan,
            as: 'kemampuan',
            attributes: ['nama'],
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
  getAll: async (req, res) => {
    try {
      const data = await Gaji.findAll({
        attributes: ['id', 'nominal', 'id_jabatan', 'id_kemampuan'],
        include: [
          {
            model: Jabatan,
            as: 'jabatan',
            attributes: ['nama'],
          },
          {
            model: Kemampuan,
            as: 'kemampuan',
            attributes: ['nama'],
          },
        ],
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      // res.status(400).json(err.message);
      console.log(err.stack);
    }
  },
  getById: async (req, res) => {
    try {
      const data = await Gaji.findOne({
        attributes: [
          'id',
          'nominal',
          'id_jabatan',
          'id_kemampuan',
          [
            Sequelize.literal(`(
              SELECT j.nama
              FROM jabatan AS j
              WHERE j.id = gaji.id_jabatan
              )`),
            'jabatan',
          ],
          [
            Sequelize.literal(`(
              SELECT k.nama
              FROM kemampuan AS k
              WHERE k.id = gaji.id_kemampuan
              )`),
            'kemampuan',
          ],
        ],
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
    const data = await Gaji.findOne({
      attributes: ['id', 'nominal', 'id_jabatan', 'id_kemampuan'],
      where: { id: req.params.id },
    });
    if (data) {
      try {
        await Gaji.destroy({
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
    const { nominal } = req.body;
    const data = await Gaji.findOne({
      attributes: ['id', 'nominal', 'id_jabatan', 'id_kemampuan'],
      where: { id: req.params.id },
    });
    if (data) {
      try {
        await Gaji.update(
          {
            nominal: nominal,
          },
          { where: { id: data.id } }
        );
        responseHelper.updated(res);
      } catch (err) {
        res.status(400).json(err.message);
      }
    } else {
      responseHelper.notFound(res);
    }
  },
  create: async (req, res) => {
    const { nominal, id_jabatan, id_kemampuan } = req.body;
    try {
      const data = await Gaji.create({
        nominal: nominal,
        id_jabatan: id_jabatan,
        id_kemampuan: id_kemampuan,
      });
      data ? responseHelper.created(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
};
