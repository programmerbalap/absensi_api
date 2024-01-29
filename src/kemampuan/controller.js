'use strict';

const responseHelper = require('../../helpers/response-helper');
const Kemampuan = require('../../models/Kemampuan');

module.exports = {
  getAll: async (req, res) => {
    try {
      const data = await Kemampuan.findAll({
        attributes: ['id', 'nama'],
      });

      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  getById: async (req, res) => {
    try {
      const data = await Kemampuan.findOne({
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
    const data = await Kemampuan.findOne({
      where: { id: req.params.id },
    });
    if (data) {
      try {
        await Kemampuan.destroy({
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
    const { nama } = req.body;
    const data = await Kemampuan.findOne({
      where: { id: req.params.id },
    });
    if (data) {
      try {
        await Kemampuan.update(
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
  create: async (req, res) => {
    const { nama } = req.body;
    try {
      const data = await Kemampuan.create({
        nama: nama,
      });
      data ? responseHelper.created(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
};
