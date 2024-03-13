'use strict';

const responseHelper = require('../../helpers/response-helper');
const Profil = require('../../models/Profil');
const fs = require('fs');

module.exports = {
  getById: async (req, res) => {
    try {
      const data = await Profil.findOne({
        attributes: ['id', 'logo', 'nama_perusahaan', 'nama_alias', 'jenis_usaha', 'profil_perusahaan', 'pimpinan', 'nomor_telepon', 'email', 'website', 'alamat', 'informasi', 'lokasi', 'min_efektif_start', 'nominal_bonus'],
        where: {
          id: req.params.id,
        },
      });
      data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  updateProfilById: async (req, res) => {
    const { nama_perusahaan, nama_alias, jenis_usaha, profil_perusahaan, pimpinan, nomor_telepon, email, website, alamat } = req.body;
    try {
      await Profil.update(
        {
          nama_perusahaan: nama_perusahaan,
          nama_alias: nama_alias,
          jenis_usaha: jenis_usaha,
          profil_perusahaan: profil_perusahaan,
          pimpinan: pimpinan,
          nomor_telepon: nomor_telepon,
          email: email,
          website: website,
          alamat: alamat,
        },
        {
          where: {
            id: req.params.id,
          },
        }
      );
      responseHelper.updated(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  updateInformasiById: async (req, res) => {
    const { informasi } = req.body;
    try {
      await Profil.update(
        {
          informasi: informasi,
        },
        {
          where: {
            id: req.params.id,
          },
        }
      );
      responseHelper.updated(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  updateMinEfektifStartById: async (req, res) => {
    const { min_efektif_start } = req.body;
    try {
      await Profil.update(
        {
          min_efektif_start: min_efektif_start,
        },
        {
          where: {
            id: req.params.id,
          },
        }
      );
      responseHelper.updated(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  updateNominalBonusById: async (req, res) => {
    const { nominal_bonus } = req.body;
    try {
      await Profil.update(
        {
          nominal_bonus: nominal_bonus,
        },
        {
          where: {
            id: req.params.id,
          },
        }
      );
      responseHelper.updated(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  updateLokasiById: async (req, res) => {
    const { lokasi } = req.body;
    try {
      await Profil.update(
        {
          lokasi: lokasi,
        },
        {
          where: {
            id: req.params.id,
          },
        }
      );
      responseHelper.updated(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  updateLogoById: async (req, res) => {
    const file = req.file;
    const data = await Profil.findOne({
      attributes: ['id', 'logo'],
      where: {
        id: req.params.id,
      },
    });

    try {
      if (data) {
        const status = fs.existsSync(`./file/${data.logo}`);
        if (status) {
          fs.unlinkSync(`./file/${data.logo}`);
        }
        await Profil.update(
          {
            logo: file ? file.filename : null,
          },
          { where: { id: req.params.id } }
        );
        responseHelper.updated(res);
      } else {
        const data = await Profil.create({
          id: req.params.id,
          logo: file ? file.filename : null,
        });
        data ? responseHelper.created(res, data) : responseHelper.notFound(res);
      }
    } catch (err) {
      res.status(400).json(err.message);
      console.log(err.stack);
    }
  },
};
