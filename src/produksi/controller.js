'use strict';

const { Op } = require('sequelize');
const responseHelper = require('../../helpers/response-helper');
const Karyawan = require('../../models/Karyawan');
const Produk = require('../../models/Produk');
const Produksi = require('../../models/Produksi');

module.exports = {
  getAll: async (req, res) => {
    try {
      const search = req.query.search_query || '';
      const data = await Produksi.findAll({
        where: {
          [Op.or]: [
            {
              '$produk.nama$': {
                [Op.like]: '%' + search + '%',
              },
            },
            {
              '$karyawan.nama$': {
                [Op.like]: '%' + search + '%',
              },
            },
          ],
        },
        include: [
          {
            model: Produk,
            as: 'produk',
          },
          {
            model: Karyawan,
            as: 'karyawan',
          },
        ],
        order: [['createdAt', 'DESC']],
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
      console.log(err.stack);
    }
  },
  getAllProduksiByUser: async (req, res) => {
    try {
      const search = req.query.search_query || '';
      const data = await Produksi.findAll({
        where: {
          [Op.and]: [
            {
              uuid_karyawan: req.params.uuid,
            },
            {
              [Op.or]: [
                {
                  '$produk.nama$': {
                    [Op.like]: '%' + search + '%',
                  },
                },
                {
                  jumlah: {
                    [Op.like]: '%' + search + '%',
                  },
                },
              ],
            },
          ],
        },
        include: [
          {
            model: Produk,
            as: 'produk',
          },
        ],
        order: [['createdAt', 'DESC']],
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
      console.log(err.stack);
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
  create: async (req, res) => {
    const { uuid_karyawan, id_produk, jumlah, tanggal } = req.body;
    try {
      const data = await Produksi.create({
        uuid_karyawan: uuid_karyawan,
        id_produk: id_produk,
        jumlah: jumlah,
        tanggal: tanggal,
      });
      data ? responseHelper.created(res, data) : responseHelper.notValid(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  updateByIdProduksiByUser: async (req, res) => {
    const { id_produk, jumlah, tanggal } = req.body;
    const data = await Produksi.findOne({
      where: { id: req.params.id },
    });
    if (data) {
      Produksi.update(
        {
          id_produk: id_produk,
          jumlah: jumlah,
          tanggal: tanggal,
        },
        { where: { id: data.id } }
      )
        .then(() => {
          responseHelper.updated(res);
        })
        .catch((err) => {
          res.status(400).json(err.message);
        });
    } else {
      responseHelper.notFound(res);
    }
  },
  updateById: async (req, res) => {
    const { id_produk, uuid_karyawan, jumlah } = req.body;
    const data = await Produksi.findOne({
      where: { id: req.params.id },
    });
    if (data) {
      Produksi.update(
        {
          id_produk: id_produk,
          uuid_karyawan: uuid_karyawan,
          jumlah: jumlah,
        },
        { where: { id: data.id } }
      )
        .then(() => {
          responseHelper.updated(res);
        })
        .catch((err) => {
          res.status(400).json(err.message);
        });
    } else {
      responseHelper.notFound(res);
    }
  },
  setujuiById: async (req, res) => {
    const { kualitas } = req.body;
    const data = await Produksi.findOne({
      where: { id: req.params.id },
    });
    if (data) {
      Produksi.update(
        {
          kualitas: kualitas,
          setujui: true,
        },
        { where: { id: data.id } }
      )
        .then(() => {
          responseHelper.updated(res);
        })
        .catch((err) => {
          res.status(400).json(err.message);
        });
    } else {
      responseHelper.notFound(res);
    }
  },
  deleteById: async (req, res) => {
    const data = await Produksi.findOne({
      where: { id: req.params.id },
    });
    if (data) {
      try {
        await Produksi.destroy({
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
