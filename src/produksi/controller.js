'use strict';

const responseHelper = require('../../helpers/response-helper');
const Produksi = require('../../models/Produksi');

module.exports = {
  getAll: async (req, res) => {
    try {
      const data = await Produksi.findAll();
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  getById: async (req, res) => {
    try {
      const data = await Produksi.findOne({
        where: {
          id: req.params.id,
        },
      });
      data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
};
