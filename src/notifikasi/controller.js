'use strict';

const responseHelper = require('../../helpers/response-helper');
const Notif = require('../../models/Notif');

module.exports = {
  getAll: async (req, res) => {
    try {
      const data = await Notif.findAll({
        attributes: ['id', 'uuid_karyawan', 'notif_satu', 'notif_dua', 'notif_tiga', 'notif_empat', 'notif_lima', 'notif_enam', 'notif_tujuh', 'notif_delapan'],
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  getById: async (req, res) => {
    try {
      const data = await Notif.findOne({
        attributes: ['id', 'uuid_karyawan', 'notif_satu', 'notif_dua', 'notif_tiga', 'notif_empat', 'notif_lima', 'notif_enam', 'notif_tujuh', 'notif_delapan'],
        where: {
          uuid_karyawan: req.params.uuid,
        },
      });
      data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(404).json(err.message);
    }
  },
  deleteById: async (req, res) => {
    const data = await Notif.findOne({
      attributes: ['id', 'uuid'],
      where: { uuid_karyawan: req.params.uuid },
    });
    if (data) {
      try {
        await Notif.destroy({
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
    const { notif_satu, notif_dua } = req.body;
    const data = await Notif.findOne({
      attributes: ['id', 'uuid_karyawan'],
      where: { uuid_karyawan: req.params.uuid },
    });
    if (data) {
      try {
        await Notif.update(
          {
            notif_satu: notif_satu,
            notif_dua: notif_dua,
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
    const { uuid_karyawan } = req.body;
    try {
      const data = await Notif.create({
        uuid_karyawan: uuid_karyawan,
      });
      data ? responseHelper.created(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
};
