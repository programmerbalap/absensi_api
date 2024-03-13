'use strict';

const { Op } = require('sequelize');
const responseHelper = require('../../helpers/response-helper');
const Statis = require('../../models/Statis');

module.exports = {
  getAll: async (req, res) => {
    try {
      const data = await Statis.findAll({
        attributes: ['id', 'jam_start', 'jam_end', 'shift', 'aktif'],
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  getById: async (req, res) => {
    try {
      const data = await Statis.findOne({
        attributes: ['id', 'jam_start', 'jam_end', 'shift', 'aktif'],
        where: {
          id: req.params.id,
        },
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  updateStatis: async (req, res) => {
    const { jam_start, jam_end, shift, min_efektif_start } = req.body;
    const data = await Statis.findOne({
      where: { id: req.params.id },
      attributes: ['id'],
    });
    if (data) {
      try {
        await Statis.update(
          {
            shift: shift,
            jam_start: jam_start,
            jam_end: jam_end,
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
  toggleShift: async (req, res) => {
    const { id, aktif } = req.body;
    try {
      await Statis.update(
        {
          aktif: !aktif,
        },
        { where: { id: id } }
      );
      await Statis.update(
        {
          aktif: aktif,
        },
        { where: { id: { [Op.ne]: [id] } } }
      );
      responseHelper.updated(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  getShiftAktif: async (req, res) => {
    try {
      const data = await Statis.findOne({
        attributes: ['id', 'jam_start', 'jam_end', 'shift', 'aktif'],
        where: {
          aktif: true,
        },
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
};
