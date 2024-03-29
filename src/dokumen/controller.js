'use strict';

const responseHelper = require('../../helpers/response-helper');
const fs = require('fs');
const Doc = require('../../models/Doc');

module.exports = {
  getAll: async (req, res) => {
    try {
      const data = await Doc.findAll();
      data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  getById: async (req, res) => {
    try {
      const data = await Doc.findOne({
        attributes: ['id', 'uuid_karyawan', 'foto'],
        where: {
          id: req.params.id,
        },
      });
      data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  updateFotoById: async (req, res) => {
    const uuid = req.params.uuid;
    const file = req.file;

    const doc = await Doc.findOne({
      attributes: ['uuid_karyawan', 'foto'],
      where: {
        uuid_karyawan: uuid,
      },
    });

    try {
      if (doc) {
        const status = fs.existsSync(`./file/${doc.foto}`);
        if (status) {
          fs.unlinkSync(`./file/${doc.foto}`);
        }
        await Doc.update(
          {
            foto: file ? file.filename : null,
          },
          { where: { uuid_karyawan: doc.uuid_karyawan } }
        );
        responseHelper.updated(res);
      } else {
        const data = await Doc.create({
          uuid_karyawan: uuid,
          foto: file ? file.filename : null,
        });
        data ? responseHelper.created(res, data) : responseHelper.notFound(res);
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  updateFotoMeByUUid: async (req, res) => {
    const file = req.file;
    const data = await Doc.findOne({
      attributes: ['uuid_karyawan', 'foto'],
      where: {
        uuid_karyawan: req.params.uuid,
      },
    });

    try {
      if (data) {
        const status = fs.existsSync(`./file/${data.foto}`);
        if (status) {
          fs.unlinkSync(`./file/${data.foto}`);
        }
        await Doc.update(
          {
            foto: file ? file.filename : null,
          },
          { where: { uuid_karyawan: data.uuid_karyawan } }
        );
        responseHelper.updated(res);
      } else {
        const data = await Doc.create({
          uuid_karyawan: req.params.uuid,
          foto: file ? file.filename : null,
        });
        data ? responseHelper.created(res, data) : responseHelper.notFound(res);
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
};
