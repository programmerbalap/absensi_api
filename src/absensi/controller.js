'use strict';

const { Op, Sequelize } = require('sequelize');
const responseHelper = require('../../helpers/response-helper');
const Absensi = require('../../models/Absensi');
const Karyawan = require('../../models/Karyawan');
const Lokasi = require('../../models/Lokasi');
const geolib = require('geolib');
const Notifikasi = require('../../models/Notifikasi');

module.exports = {
  presensi_check_in_all: async (req, res) => {
    const { uuid_user, hadir, lat, lng, tanggal, keterangan, penjab, time_start, time_end, bonus, shift, nominal_bonus } = req.body;

    try {
      const data = await Karyawan.findAll({
        attributes: [
          'uuid',
          'nama',
          [
            Sequelize.literal(`(
              SELECT k.nama
              FROM kemampuan AS k
              WHERE karyawan.id_kemampuan = k.id
              )`),
            'kemampuan',
          ],
          [
            Sequelize.literal(`(
              SELECT j.nama
              FROM jabatan AS j
              WHERE karyawan.id_jabatan = j.id
              )`),
            'jabatan',
          ],
          [
            Sequelize.literal(`(
              SELECT g.nominal
              FROM gaji AS g
              JOIN jabatan AS j ON karyawan.id_jabatan = j.id
              JOIN kemampuan AS k ON karyawan.id_kemampuan = k.id
              WHERE g.id_jabatan = j.id
              AND g.id_kemampuan = k.id 
              )`),
            'gaji',
          ],
        ],
        where: {
          [Op.and]: [
            { status_karyawan: 'aktif' },
            {
              id_jabatan: {
                [Op.not]: [1, 2],
              },
            },
            ,
            { on: false },
          ],
        },
      });

      if (!data) return responseHelper.notFound(res);

      const locationSetting = await Lokasi.findOne({
        attributes: ['latitude', 'longitude', 'max_jarak', 'nama'],
        where: {
          [Op.and]: [{ uuid_karyawan: uuid_user }, { aktif: true }],
        },
      });

      if (!locationSetting) return responseHelper.notFound(res);

      const distance = geolib.getDistance({ lat, lng }, { latitude: locationSetting.latitude, longitude: locationSetting.longitude });
      if (distance <= locationSetting.max_jarak) {
        for (let i = 0; i < data.length; i++) {
          const absen = await Absensi.create({
            uuid_karyawan: data[i].dataValues.uuid,
            tanggal: tanggal,
            hadir: hadir,
            keterangan: keterangan,
            time_start: time_start,
            time_end: time_end,
            shift: shift,
            latitude: lat,
            longitude: lng,
            bonus: bonus,
            nama_lokasi: locationSetting.nama,
            nominal_bonus: nominal_bonus,
            nominal_gaji: data[i].dataValues.gaji,
            kemampuan: data[i].dataValues.kemampuan,
            jabatan: data[i].dataValues.jabatan,
            penjab: penjab,
          });
          await Notifikasi.create({
            id_absensi: absen.id,
          });
          await Karyawan.update({ on: true }, { where: { uuid: data[i].uuid } });
        }
        responseHelper.created(res);
      } else {
        res.status(403).json({ msg: 'Anda sedang berada diluar radius.' });
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  presensi_check_in_all_no_lokasi: async (req, res) => {
    const { hadir, tanggal, keterangan, penjab, time_start, time_end, bonus, shift, nominal_bonus } = req.body;

    try {
      const data = await Karyawan.findAll({
        attributes: [
          'uuid',
          'nama',
          [
            Sequelize.literal(`(
              SELECT k.nama
              FROM kemampuan AS k
              WHERE karyawan.id_kemampuan = k.id
              )`),
            'kemampuan',
          ],
          [
            Sequelize.literal(`(
              SELECT j.nama
              FROM jabatan AS j
              WHERE karyawan.id_jabatan = j.id
              )`),
            'jabatan',
          ],
          [
            Sequelize.literal(`(
              SELECT g.nominal
              FROM gaji AS g
              JOIN jabatan AS j ON karyawan.id_jabatan = j.id
              JOIN kemampuan AS k ON karyawan.id_kemampuan = k.id
              WHERE g.id_jabatan = j.id
              AND g.id_kemampuan = k.id 
              )`),
            'gaji',
          ],
        ],
        where: {
          [Op.and]: [
            { status_karyawan: 'aktif' },
            {
              id_jabatan: {
                [Op.not]: [1, 2],
              },
            },
            ,
            { on: false },
          ],
        },
      });

      if (!data) return responseHelper.notFound(res);

      for (let i = 0; i < data.length; i++) {
        const absen = await Absensi.create({
          uuid_karyawan: data[i].dataValues.uuid,
          tanggal: tanggal,
          hadir: hadir,
          keterangan: keterangan,
          time_start: time_start,
          time_end: time_end,
          shift: shift,
          latitude: 0,
          longitude: 0,
          nama_lokasi: '-',
          bonus: bonus,
          nominal_bonus: nominal_bonus,
          nominal_gaji: data[i].dataValues.gaji,
          kemampuan: data[i].dataValues.kemampuan,
          jabatan: data[i].dataValues.jabatan,
          penjab: penjab,
        });
        await Notifikasi.create({
          id_absensi: absen.id,
        });
        await Karyawan.update({ on: true }, { where: { uuid: data[i].uuid } });
      }
      responseHelper.created(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  presensi_check_in: async (req, res) => {
    const { uuid_user, uuid_karyawan, tanggal, hadir, keterangan, time_start, time_end, shift, lat, lng, bonus, nominal_bonus, nominal_gaji, kemampuan, jabatan, penjab } = req.body;
    try {
      const locationSetting = await Lokasi.findOne({
        attributes: ['latitude', 'longitude', 'max_jarak', 'nama'],
        where: {
          [Op.and]: [{ uuid_karyawan: uuid_user }, { aktif: true }],
        },
      });

      const distance = geolib.getDistance({ lat, lng }, { latitude: locationSetting.latitude, longitude: locationSetting.longitude });
      if (distance <= locationSetting.max_jarak) {
        const data = await Absensi.create({
          uuid_karyawan: uuid_karyawan,
          tanggal: tanggal,
          hadir: hadir,
          keterangan: keterangan,
          time_start: time_start,
          time_end: time_end,
          shift: shift,
          latitude: lat,
          longitude: lng,
          bonus: bonus,
          nama_lokasi: locationSetting.nama,
          nominal_bonus: nominal_bonus,
          nominal_gaji: nominal_gaji,
          kemampuan: kemampuan,
          jabatan: jabatan,
          penjab: penjab,
        });

        if (data) {
          await Notifikasi.create({
            id_absensi: data.id,
          });
          await Karyawan.update(
            {
              on: true,
            },
            {
              where: {
                uuid: uuid_karyawan,
              },
            }
          );
          responseHelper.created(res, data);
        }
      } else {
        res.status(403).json({ msg: 'Anda sedang berada diluar radius.' });
      }
    } catch (err) {
      // res.status(400).json(err.message);
      console.log(err.stack);
    }
  },
  presensi_check_in_no_lokasi: async (req, res) => {
    const { uuid_karyawan, tanggal, hadir, keterangan, time_start, time_end, shift, bonus, nominal_bonus, nominal_gaji, kemampuan, jabatan, penjab } = req.body;
    try {
      const data = await Absensi.create({
        uuid_karyawan: uuid_karyawan,
        tanggal: tanggal,
        hadir: hadir,
        keterangan: keterangan,
        time_start: time_start,
        time_end: time_end,
        shift: shift,
        latitude: 0,
        longitude: 0,
        bonus: bonus,
        nama_lokasi: '-',
        nominal_bonus: nominal_bonus,
        nominal_gaji: nominal_gaji,
        kemampuan: kemampuan,
        jabatan: jabatan,
        penjab: penjab,
      });

      if (data) {
        await Notifikasi.create({
          id_absensi: data.id,
        });
        await Karyawan.update(
          {
            on: true,
          },
          {
            where: {
              uuid: uuid_karyawan,
            },
          }
        );
        responseHelper.created(res, data);
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  presensi_update: async (req, res) => {
    const { time_start, time_end } = req.body;
    const data = await Absensi.findOne({
      attributes: ['id'],
      where: {
        id: req.params.id,
      },
    });

    if (!data) {
      responseHelper.notFound(res);
    }
    try {
      await Absensi.update(
        {
          time_start: time_start,
          time_end: time_end,
        },
        {
          where: {
            id: req.params.id,
          },
        }
      );

      responseHelper.updated(res, data);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  presensi_tambah: async (req, res) => {
    const { uuid_karyawan, tanggal, hadir, keterangan, time_start, time_end, shift, bonus, nominal_bonus, nominal_gaji, kemampuan, jabatan, penjab } = req.body;
    try {
      const data = await Absensi.create({
        uuid_karyawan: uuid_karyawan,
        tanggal: tanggal,
        hadir: hadir,
        keterangan: keterangan,
        time_start: time_start,
        time_end: time_end,
        shift: shift,
        latitude: 0,
        longitude: 0,
        bonus: bonus,
        nama_lokasi: '-',
        nominal_bonus: nominal_bonus,
        nominal_gaji: nominal_gaji,
        kemampuan: kemampuan,
        jabatan: jabatan,
        penjab: penjab,
      });

      if (data) {
        await Notifikasi.create({
          id_absensi: data.id,
        });
        responseHelper.created(res, data);
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  presensi_check_out: async (req, res) => {
    const { uuid_user, uuid_karyawan, time_end, lat, lng } = req.body;

    try {
      const locationSetting = await Lokasi.findOne({
        attributes: ['latitude', 'longitude', 'max_jarak'],
        where: {
          [Op.and]: [{ uuid_karyawan: uuid_user }, { aktif: true }],
        },
      });

      const distance = geolib.getDistance({ lat, lng }, { latitude: locationSetting.latitude, longitude: locationSetting.longitude });

      if (distance <= locationSetting.max_jarak) {
        const data = await Absensi.findOne({
          where: {
            id: req.params.id,
          },
        });

        if (!data) return responseHelper.notFound(res);

        await Absensi.update(
          {
            time_end: time_end,
          },
          {
            where: {
              [Op.and]: [{ uuid_karyawan: uuid_karyawan }, { id: req.params.id }],
            },
          }
        );

        await Notifikasi.update(
          {
            notif_satu: false,
          },
          {
            where: {
              id_absensi: req.params.id,
            },
          }
        );
        responseHelper.updated(res);
      } else {
        res.status(403).json({ msg: 'Anda sedang berada diluar radius.' });
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  presensi_check_out_no_lokasi: async (req, res) => {
    const { uuid_karyawan, time_end } = req.body;

    try {
      const data = await Absensi.findOne({
        where: {
          id: req.params.id,
        },
      });

      if (!data) return responseHelper.notFound(res);

      await Absensi.update(
        {
          time_end: time_end,
        },
        {
          where: {
            [Op.and]: [{ uuid_karyawan: uuid_karyawan }, { id: req.params.id }],
          },
        }
      );

      await Notifikasi.update(
        {
          notif_satu: false,
        },
        {
          where: {
            id_absensi: req.params.id,
          },
        }
      );
      responseHelper.updated(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  presensi_selesai: async (req, res) => {
    try {
      const cekKaryawan = await Karyawan.findOne({
        attributes: ['uuid'],
        where: {
          [Op.and]: [
            { on: false },
            {
              id_jabatan: {
                [Op.not]: [1, 2],
              },
            },
          ],
        },
      });

      if (cekKaryawan) return res.status(409).json({ msg: 'Pastikan absen semua!' });

      const { tanggal, uuid_user, time_end, lat, lng } = req.body;

      const dateObject = new Date(tanggal);

      const locationSetting = await Lokasi.findOne({
        attributes: ['latitude', 'longitude', 'max_jarak'],
        where: {
          [Op.and]: [{ uuid_karyawan: uuid_user }, { aktif: true }],
        },
      });

      if (!locationSetting) return responseHelper.notFound(res);

      const distance = geolib.getDistance({ lat, lng }, { latitude: locationSetting.latitude, longitude: locationSetting.longitude });
      if (distance <= locationSetting.max_jarak) {
        const data = await Absensi.findAll({
          where: { [Op.and]: [{ tanggal: dateObject }, { time_end: null }], [Op.not]: [{ time_start: null }] },
        });

        if (!data) {
          await Karyawan.update({ on: false }, { where: {} });
          res.status(200).json({ msg: 'Absensi telah diakhiri!' });
        } else {
          for (let i = 0; i < data.length; i++) {
            await Absensi.update({ time_end: time_end }, { where: { id: data[i].id } });
          }
          await Karyawan.update({ on: false }, { where: {} });
        }
        res.status(200).json({ msg: 'Absensi telah diakhiri!' });
      } else {
        res.status(403).json({ msg: 'Anda sedang berada diluar radius.' });
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  presensi_selesai_no_lokasi: async (req, res) => {
    const cekKaryawan = await Karyawan.findOne({
      attributes: ['uuid'],
      where: {
        [Op.and]: [
          { on: false },
          {
            id_jabatan: {
              [Op.not]: [1, 2],
            },
          },
        ],
      },
    });

    if (cekKaryawan) return res.status(409).json({ msg: 'Pastikan absen semua!' });

    const { tanggal, time_end } = req.body;
    try {
      const dateObject = new Date(tanggal);
      const data = await Absensi.findAll({
        where: { [Op.and]: [{ tanggal: dateObject }, { time_end: null }], [Op.not]: [{ time_start: null }] },
      });

      if (!data) {
        await Karyawan.update(
          { on: false },
          {
            where: {
              on: true,
            },
          }
        );
        responseHelper.updated(res);
      } else {
        for (let i = 0; i < data.length; i++) {
          await Absensi.update({ time_end: time_end }, { where: { id: data[i].id } });
        }
        await Karyawan.update(
          { on: false },
          {
            where: {
              on: true,
            },
          }
        );
        responseHelper.updated(res);
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  getAbsensiLastByUser: async (req, res) => {
    const { tanggal, shift } = req.query;
    const tanggalObject = new Date(tanggal);
    try {
      const data = await Absensi.findOne({
        attributes: ['id', 'tanggal', 'hadir', 'time_start', 'time_end', 'bonus'],
        where: {
          [Op.and]: [{ time_end: null }, { uuid_karyawan: req.params.uuid }, { exp: false }, { shift: shift }, { tanggal: tanggalObject }],
        },
      });

      responseHelper.readSingleData(res, data);
    } catch (err) {
      res.status(404).json(err.message);
    }
  },
  getDataAbsensi: async (req, res) => {
    const search = req.query.search_query || '';
    try {
      const data = await Absensi.findAll({
        attributes: ['id', 'tanggal', 'hadir', 'shift', 'keterangan', 'time_start', 'time_end', 'nama_lokasi', 'penjab'],
        include: [
          {
            model: Karyawan,
            as: 'karyawan',
            attributes: ['nama'],
          },
        ],
        where: {
          [Op.and]: [
            {
              [Op.or]: [
                {
                  hadir: {
                    [Op.like]: '%' + search + '%',
                  },
                },
                {
                  '$karyawan.nama$': {
                    [Op.like]: '%' + search + '%',
                  },
                },
                {
                  shift: {
                    [Op.like]: '%' + search + '%',
                  },
                },
              ],
            },
          ],
        },

        order: [['id', 'DESC']],
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  deleteAbsensiById: async (req, res) => {
    const data = await Absensi.findOne({
      where: { id: req.params.id },
    });
    if (data) {
      try {
        await Absensi.destroy({
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
  getDataAbsensiById: async (req, res) => {
    try {
      const data = await Absensi.findOne({
        attributes: ['id', 'tanggal', 'hadir', 'shift', 'keterangan', 'time_start', 'time_end', 'nama_lokasi'],
        include: [
          {
            model: Karyawan,
            as: 'karyawan',
            attributes: ['nama'],
          },
        ],
        where: {
          [Op.and]: [{ id: req.params.id }],
        },
      });
      data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  getDataAbsensiByUser: async (req, res) => {
    try {
      const data = await Absensi.findAll({
        attributes: ['id', 'tanggal', 'hadir', 'shift', 'time_start', 'time_end', 'exp', 'bonus', 'nama_lokasi', 'penjab'],
        where: {
          [Op.and]: [{ uuid_karyawan: req.params.uuid }],
        },
        order: [['id', 'DESC']],
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  presensi_user_hadir: async (req, res) => {
    const { uuid_user, uuid_karyawan, tanggal, hadir, keterangan, time_start, time_end, shift, lat, lng, bonus, nominal_bonus, nominal_gaji, kemampuan, jabatan, penjab } = req.body;
    try {
      const locationSetting = await Lokasi.findOne({
        attributes: ['latitude', 'longitude', 'max_jarak', 'nama'],
        where: {
          [Op.and]: [{ uuid_karyawan: uuid_user }, { aktif: true }],
        },
      });

      const distance = geolib.getDistance({ lat, lng }, { latitude: locationSetting.latitude, longitude: locationSetting.longitude });
      if (distance <= locationSetting.max_jarak) {
        const data = await Absensi.create({
          uuid_karyawan: uuid_karyawan,
          tanggal: tanggal,
          hadir: hadir,
          keterangan: keterangan,
          time_start: time_start,
          time_end: time_end,
          shift: shift,
          latitude: lat,
          longitude: lng,
          bonus: bonus,
          nama_lokasi: locationSetting.nama,
          nominal_bonus: nominal_bonus,
          nominal_gaji: nominal_gaji,
          kemampuan: kemampuan,
          jabatan: jabatan,
          penjab: penjab,
        });

        if (data) {
          await Notifikasi.create({
            id_absensi: data.id,
          });
          await Karyawan.update(
            {
              on: true,
            },
            {
              where: {
                uuid: uuid_karyawan,
              },
            }
          );
          responseHelper.created(res, data);
        }
      } else {
        res.status(403).json({ msg: 'Anda sedang berada diluar radius.' });
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  presensi_user_hadir_no_lokasi: async (req, res) => {
    const { uuid_karyawan, tanggal, hadir, keterangan, time_start, time_end, shift, bonus, nominal_bonus, nominal_gaji, kemampuan, jabatan, penjab } = req.body;
    try {
      const data = await Absensi.create({
        uuid_karyawan: uuid_karyawan,
        tanggal: tanggal,
        hadir: hadir,
        keterangan: keterangan,
        time_start: time_start,
        time_end: time_end,
        shift: shift,
        latitude: 0,
        longitude: 0,
        bonus: bonus,
        nama_lokasi: '-',
        nominal_bonus: nominal_bonus,
        nominal_gaji: nominal_gaji,
        kemampuan: kemampuan,
        jabatan: jabatan,
        penjab: penjab,
      });

      if (data) {
        await Notifikasi.create({
          id_absensi: data.id,
        });
        await Karyawan.update(
          {
            on: true,
          },
          {
            where: {
              uuid: uuid_karyawan,
            },
          }
        );
        responseHelper.created(res, data);
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  presensi_user_izin: async (req, res) => {
    const { uuid_karyawan, tanggal, keterangan, time_start, shift, kemampuan, hadir } = req.body;
    try {
      const data = await Absensi.create({
        uuid_karyawan: uuid_karyawan,
        tanggal: tanggal,
        hadir: hadir,
        keterangan: keterangan,
        time_start: time_start,
        time_end: null,
        shift: shift,
        latitude: null,
        longitude: null,
        bonus: false,
        nominal_bonus: null,
        nominal_gaji: null,
        kemampuan: kemampuan,
      });

      if (data) {
        await Notifikasi.create({
          id_absensi: data.id,
        });
        await Karyawan.update(
          {
            on: true,
          },
          {
            where: {
              uuid: uuid_karyawan,
            },
          }
        );
        responseHelper.created(res, data);
      }
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
};
