'use strict';

const responseHelper = require('../../helpers/response-helper');
const Jabatan = require('../../models/Jabatan');

module.exports = {
  getAll: async (req, res) => {
    try {
      const data = await Jabatan.findAll();
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  getById: async (req, res) => {
    try {
      const data = await Jabatan.findOne({
        where: {
          id: req.params.id,
        },
      });
      data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  create: async (req, res) => {
    const { nama } = req.body;
    try {
      const data = await Jabatan.create({
        nama: nama,
      });
      data ? responseHelper.created(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  updateById: async (req, res) => {
    const { nama } = req.body;
    const data = await Jabatan.findOne({
      where: { id: req.params.id },
    });
    if (data) {
      try {
        await Jabatan.update(
          {
            nama: nama,
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
  deleteById: async (req, res) => {
    const data = await Jabatan.findOne({
      where: { id: req.params.id },
    });
    if (data) {
      try {
        await Jabatan.destroy({
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
};
