'use strict';

const axios = require('axios');
const responseHelper = require('../../helpers/response-helper');
const Kabupaten = require('../../models/Kabupaten');

module.exports = {
  getAll: async (req, res) => {
    try {
      const data = await Kabupaten.findAll({
        attributes: ['id', 'nama'],
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },

  generate: async (req, res) => {
    try {
      const responseProvinsi = await axios.get('https://dev.farizdotid.com/api/daerahindonesia/provinsi');
      const provinsi = responseProvinsi.data.provinsi;
      // console.log(provinsi);

      for (let i = 0; i < provinsi.length; i++) {
        const idProvinsi = provinsi[i].id;

        try {
          const responseKota = await axios.get(`https://dev.farizdotid.com/api/daerahindonesia/kota?id_provinsi=35`);
          const kota = responseKota.data.kota_kabupaten;
          // console.log(kota);
          for (let k = 0; k < kota.length; k++) {
            const idKota = kota[k].id;
            const namaKota = kota[k].nama;

            await Kabupaten.create({
              id: idKota,
              nama: namaKota,
            });
          }
        } catch (err) {
          console.error(`Error fetching city data for province with id ${idProvinsi}:`, err.message);
        }
      }

      res.status(200).json({ message: 'Data has been successfully generated.' });
    } catch (err) {
      res.status(500).json({ error: 'Internal Server Error' });
    }
  },
};
