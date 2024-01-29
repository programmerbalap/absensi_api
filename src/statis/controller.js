'use strict';

const { Op } = require('sequelize');
const responseHelper = require('../../helpers/response-helper');
const Statis = require('../../models/Statis');

module.exports = {
  getStatis: async (req, res) => {
    try {
      const data = await Statis.findOne({
        attributes: ['id', 'jam_start', 'jam_end', 'shift', 'min_efektif_start', 'nominal_bonus', 'aktif'],
        where: { aktif: true },
      });
      data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(404).json(err.message);
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

  updateStatis: async (req, res) => {
    const { jam_start, jam_end } = req.body;
    const data = await Statis.findOne({
      where: { id: 1 },
    });
    if (data) {
      try {
        await Statis.update(
          {
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
};
