'use strict';

const { Op } = require('sequelize');
const responseHelper = require('../../helpers/response-helper');
const Hak_akses = require('../../models/Hak_akses');
const Jabatan = require('../../models/Jabatan');
const Karyawan = require('../../models/Karyawan');
const Doc = require('../../models/Doc');

module.exports = {
  getAllHakAkses: async (req, res) => {
    const search = req.query.search_query || '';
    try {
      const data = await Karyawan.findAll({
        attributes: ['uuid', 'nama', 'email', 'no_nik', 'jk', 'status_karyawan', 'no_telepon', 'no_rekening'],
        where: {
          [Op.and]: [
            { status_karyawan: 'aktif' },
            { id_jabatan: { [Op.ne]: [3] } },
            { id_jabatan: { [Op.ne]: [4] } },
            {
              [Op.or]: [
                {
                  nama: {
                    [Op.like]: '%' + search + '%',
                  },
                },
                {
                  no_nik: {
                    [Op.like]: '%' + search + '%',
                  },
                },
              ],
            },
          ],
        },
        include: [
          {
            model: Jabatan,
            as: 'jabatan',
            attributes: ['nama'],
          },
          {
            model: Hak_akses,
            as: 'hak_akses',
          },
          {
            model: Doc,
            as: 'doc',
            attributes: ['foto'],
          },
        ],
        order: [['createdAt', 'DESC']],
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      // res.status(400).json(err.message);
      console.log(err.stack);
    }
  },

  updateByUuidHakAkses: async (req, res) => {
    // const data = await Hak_akses.findOne({
    //   uuid_karyawan: req.params.uuid,
    // });
    const { hk_gaji, hk_absensi, hk_kemampuan, hk_keterlambatan, hk_notifikasi, hk_hak_akses, hk_jabatan, hk_bonus, hk_produksi, hk_karyawan } = req.body;

    console.log('jsakjskajsakjskasa', hk_gaji, hk_absensi, hk_kemampuan, hk_keterlambatan, hk_notifikasi, hk_hak_akses, hk_jabatan, hk_bonus, hk_produksi, hk_karyawan);
    // if (data) {
    //   try {
    //     await Hak_akses.update(
    //       {
    //         hk_gaji: hk_gaji,
    //         hk_absensi: hk_absensi,
    //         hk_kemampuan: hk_kemampuan,
    //         hk_keterlambatan: hk_keterlambatan,
    //         hk_notifikasi: hk_notifikasi,
    //         hk_hak_akses: hk_hak_akses,
    //         hk_jabatan: hk_jabatan,
    //         hk_bonus: hk_bonus,
    //         hk_produksi: hk_produksi,
    //         hk_karyawan: hk_karyawan,
    //       },
    //       {
    //         where: {
    //           uuid_karyawan: data.uuid_karyawan,
    //         },
    //       }
    //     );

    //     responseHelper.updated(res);
    //   } catch (err) {
    //     res.status(400).json(err.message);
    //   }
    // } else {
    //   responseHelper.notFound(res);
    // }
  },
};
