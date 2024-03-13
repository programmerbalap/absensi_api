'use strict';

const responseHelper = require('../../helpers/response-helper');
const Produk = require('../../models/Produk');

module.exports = {
  getAll: async (req, res) => {
    try {
      const data = await Produk.findAll();
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  getById: async (req, res) => {
    try {
      const data = await Produk.findOne({
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
      const data = await Produk.create({
        nama: nama,
      });
      data ? responseHelper.created(res, data) : responseHelper.notValid(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  updateById: async (req, res) => {
    const { nama } = req.body;
    const data = await Produk.findOne({
      where: { id: req.params.id },
    });
    if (data) {
      try {
        await Produk.update(
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
    const data = await Produk.findOne({
      where: { id: req.params.id },
    });
    if (data) {
      try {
        await Produk.destroy({
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
