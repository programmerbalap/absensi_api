'use strict';

const { Op, Sequelize } = require('sequelize');
const responseHelper = require('../../helpers/response-helper');
const Karyawan = require('../../models/Karyawan');
const Absensi = require('../../models/Absensi');
const Jabatan = require('../../models/Jabatan');
const Doc = require('../../models/Doc');
const Lokasi = require('../../models/Lokasi');
const Kabupaten = require('../../models/Kabupaten');
const Kemampuan = require('../../models/Kemampuan');
const Hak_akses = require('../../models/Hak_akses');
const bcrypt = require('bcrypt');
const fs = require('fs');

module.exports = {
  karyawan_get_check_in: async (req, res) => {
    const search = req.query.search_query || '';
    try {
      const data = await Karyawan.findAll({
        attributes: [
          'uuid',
          'nama',
          'jk',
          [
            Sequelize.literal(`(
              SELECT g.nominal
              FROM gaji AS g
              WHERE g.id_jabatan = karyawan.id_jabatan 
              AND g.id_kemampuan = karyawan.id_kemampuan 
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
            { on: false },
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
            model: Kemampuan,
            as: 'kemampuan',
            attributes: ['nama'],
          },
          {
            model: Doc,
            as: 'doc',
            attributes: ['foto'],
          },
        ],
        order: [['createdAt', 'DESC']],
      });
      responseHelper.readAllData(res, data);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  Karyawan_get_checkOut: async (req, res) => {
    const search = req.query.search_query || '';
    const { tanggal, nama_shift } = req.query;
    const dateObject = new Date(tanggal);
    try {
      const data = await Karyawan.findAll({
        attributes: [
          'uuid',
          'nama',
          'no_nik',
          'jk',
          [
            Sequelize.literal(`(
            SELECT MIN(a.time_start)
            FROM absensi AS a
            WHERE karyawan.uuid = a.uuid_karyawan
            AND a.tanggal = '${tanggal}'
            AND a.shift = '${nama_shift}'
            )`),
            'jam_mulai',
          ],
          [
            Sequelize.literal(`(
            SELECT a.time_start
            FROM absensi AS a
            WHERE karyawan.uuid = a.uuid_karyawan
            AND a.tanggal = '${tanggal}'
            AND a.shift = '${nama_shift}'
            ORDER BY a.id DESC
            LIMIT 1
            )`),
            'durasi_mulai',
          ],
          [
            Sequelize.literal(`(
            SELECT MIN(a.hadir)
            FROM absensi AS a
            WHERE karyawan.uuid = a.uuid_karyawan
            AND a.tanggal = '${tanggal}'
            AND a.shift = '${nama_shift}'
            )`),
            'hadir',
          ],
          [
            Sequelize.literal(`(
              SELECT TIME_FORMAT(SEC_TO_TIME(ROUND(SUM(TIMESTAMPDIFF(SECOND, a.time_start, a.time_end)))), '%H:%i:%s')
              FROM absensi AS a
              WHERE karyawan.uuid = a.uuid_karyawan
              AND a.tanggal = '${tanggal}'
              AND a.shift = '${nama_shift}'
              )`),
            'durasi',
          ],
          [
            Sequelize.literal(`(
          SELECT g.nominal
          FROM gaji AS g
          WHERE g.id_jabatan = jabatan.id
          AND g.id_kemampuan = kemampuan.id 
          )`),
            'nominal_gaji',
          ],
          [
            Sequelize.literal(`(
          SELECT p.nominal_bonus
          FROM profil AS p
          WHERE p.id = 1
          )`),
            'nominal_bonus',
          ],
        ],
        where: {
          [Op.and]: [
            { status_karyawan: 'Aktif' },
            { on: true },
            {
              id_jabatan: {
                [Op.not]: [1, 2],
              },
            },
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
            model: Absensi,
            as: 'absensi',
            where: {
              [Op.and]: [{ tanggal: dateObject }, { shift: nama_shift }],
            },
            limit: 1,
            order: [['id', 'DESC']],
            required: false,
          },
          {
            model: Jabatan,
            as: 'jabatan',
            attributes: ['nama'],
          },
          {
            model: Kemampuan,
            as: 'kemampuan',
            attributes: ['nama'],
          },
          {
            model: Doc,
            as: 'doc',
            attributes: ['foto'],
          },
        ],
      });
      const filteredData = data.filter((employee) => employee.absensi.length > 0);
      responseHelper.readAllData(res, filteredData);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  Karyawan_get_pemulihan: async (req, res) => {
    const search = req.query.search_query || '';
    const { tanggal, shift } = req.query;
    console.log(tanggal, shift);
    const dateObject = new Date(tanggal);
    try {
      const data = await Karyawan.findAll({
        attributes: ['uuid', 'nama', 'no_nik', 'jk'],
        where: {
          [Op.and]: [
            { status_karyawan: 'aktif' },
            { on: true },
            { id_jabatan: { [Op.not]: [1, 2] } },
            {
              [Op.or]: [
                { nama: { [Op.like]: '%' + search + '%' } },
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
            model: Absensi,
            as: 'absensi',
            where: {
              [Op.and]: [
                {
                  tanggal: {
                    [Op.not]: dateObject,
                  },
                },
                {
                  shift: shift,
                },
                { time_end: null },
                { exp: false },
              ],
            },
            limit: 1,
            order: [['id', 'DESC']],
            required: true,
          },
          {
            model: Jabatan,
            as: 'jabatan',
            attributes: ['nama'],
          },
          {
            model: Doc,
            as: 'doc',
            attributes: ['foto'],
          },
        ],
      });

      const filteredData = data.filter((employee) => employee.absensi.length > 0);
      responseHelper.readAllData(res, filteredData);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  karyawan_get_all_aktif: async (req, res) => {
    const search = req.query.search_query || '';
    try {
      const data = await Karyawan.findAll({
        attributes: ['uuid', 'nama', 'email', 'no_nik', 'jk', 'status_karyawan', 'tgl_lhr', 'no_telepon', 'no_rekening'],
        where: {
          [Op.and]: [
            { status_karyawan: 'aktif' },
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
            model: Kabupaten,
            as: 'alamat',
            attributes: ['nama'],
          },
          {
            model: Kabupaten,
            as: 'tmpLahir',
            attributes: ['nama'],
          },
          {
            model: Kemampuan,
            as: 'kemampuan',
            attributes: ['nama'],
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
      res.status(400).json(err.message);
    }
  },
  karyawan_get_all_non_aktif: async (req, res) => {
    const search = req.query.search_query || '';
    try {
      const data = await Karyawan.findAll({
        attributes: ['uuid', 'nama', 'no_nik', 'jk', 'status_karyawan', 'tgl_lhr', 'no_telepon', 'no_rekening'],
        where: {
          [Op.and]: [
            { status_karyawan: 'non aktif' },
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
            model: Kabupaten,
            as: 'alamat',
            attributes: ['nama'],
          },
          {
            model: Kabupaten,
            as: 'tmpLahir',
            attributes: ['nama'],
          },
          {
            model: Kemampuan,
            as: 'kemampuan',
            attributes: ['nama'],
          },
          {
            model: Doc,
            as: 'doc',
            attributes: ['foto'],
          },
        ],
      });

      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  karyawan_delete_by_uuid: async (req, res) => {
    const data = await Karyawan.findOne({
      attributes: ['uuid'],
      where: { uuid: req.params.uuid },
    });

    if (data) {
      const doc = await Doc.findOne({
        attributes: ['uuid_karyawan', 'foto'],
        where: { uuid_karyawan: data.uuid },
      });
      if (doc && doc.foto) {
        try {
          const foto = fs.existsSync(`./file/${doc.foto}`);
          if (foto) {
            fs.unlinkSync(`./file/${doc.foto}`);
            await Karyawan.destroy({
              where: { uuid: data.uuid },
            });
            responseHelper.deleted(res);
          } else {
            await Karyawan.destroy({
              where: { uuid: data.uuid },
            });
            responseHelper.deleted(res);
          }
        } catch (err) {
          res.status(400).json(err.message);
        }
      } else {
        try {
          await Karyawan.destroy({
            where: { uuid: data.uuid },
          });
          responseHelper.deleted(res);
        } catch (err) {
          res.status(400).json(err.message);
        }
      }
    } else {
      responseHelper.notFound(res);
    }
  },
  karyawan_tambah: async (req, res) => {
    const { nama, email, password, confirm_password, no_nik, jk, id_jabatan, tmp_lhr, tgl_lhr, id_kab, no_telepon, no_rekening, id_kemampuan } = req.body;
    const status_email = await Karyawan.findOne({
      attributes: ['uuid', 'email'],
      where: {
        email: email,
      },
    });
    if (status_email) return res.status(409).json({ msg: 'Email telah digunakan' });

    if (password != confirm_password) return res.status(422).json({ msg: 'Konfirmasi password salah!' });

    const salt = await bcrypt.genSalt();

    const hashPassword = await bcrypt.hash(password, salt);
    try {
      const data = await Karyawan.create({
        nama: nama,
        email: email,
        password: hashPassword,
        no_nik: no_nik,
        jk: jk,
        id_jabatan: id_jabatan,
        tmp_lhr: tmp_lhr,
        tgl_lhr: tgl_lhr,
        id_kab: id_kab,
        no_telepon: no_telepon,
        no_rekening: no_rekening,
        on: 0,
        status_karyawan: 'Aktif',
        id_kemampuan: id_kemampuan,
      });

      if (data) {
        await Doc.create({
          uuid_karyawan: data.uuid,
        });
        await Hak_akses.create({
          uuid_karyawan: data.uuid,
        });
        const lok = await Lokasi.create({
          uuid_karyawan: data.uuid,
        });

        await Lokasi.update(
          {
            aktif: true,
          },
          {
            where: {
              [Op.and]: [{ uuid_karyawan: data.uuid }, { id: lok.id }],
            },
          }
        );

        responseHelper.created(res, data);
      }
    } catch (err) {
      res.status(400).json({ eror: err.message, msg: err.stack });

      console.log(err.stack);
    }
  },
  karyawan_set_status: async (req, res) => {
    const { status } = req.body;
    const data = await Karyawan.findOne({
      where: { uuid: req.params.uuid },
      attributes: ['uuid'],
    });

    if (data) {
      try {
        await Karyawan.update(
          {
            status_karyawan: status,
          },
          { where: { uuid: data.uuid } }
        );
        responseHelper.updated(res);
      } catch (err) {
        res.status(400).json(err.message);
      }
    } else {
      responseHelper.notFound(res);
    }
  },
  karyawan_get_by_uuid: async (req, res) => {
    try {
      const data = await Karyawan.findOne({
        attributes: [
          'uuid',
          'nama',
          'no_nik',
          'jk',
          'status_karyawan',
          'tgl_lhr',
          'no_telepon',
          'no_rekening',
          'id_jabatan',
          'tmp_lhr',
          'tgl_lhr',
          'id_kab',
          'id_kemampuan',
          [
            Sequelize.literal(`(
            SELECT g.nominal
            FROM gaji AS g
            WHERE g.id_jabatan = karyawan.id_jabatan 
            AND g.id_kemampuan = karyawan.id_kemampuan 
            )`),
            'gaji',
          ],
        ],
        where: { uuid: req.params.uuid },
        include: [
          {
            model: Jabatan,
            as: 'jabatan',
            attributes: ['nama'],
          },
          {
            model: Kemampuan,
            as: 'kemampuan',
            attributes: ['nama'],
          },
        ],
      });
      data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(404).json(err.message);
    }
  },
  karyawan_update_by_uuid: async (req, res) => {
    const { nama, no_nik, jk, id_jabatan, tmp_lhr, tgl_lhr, id_kab, no_telepon, no_rekening, id_kemampuan } = req.body;
    const data = await Karyawan.findOne({
      where: { uuid: req.params.uuid },
      attributes: ['uuid'],
    });

    try {
      if (data) {
        await Karyawan.update(
          {
            nama: nama,
            no_nik: no_nik,
            jk: jk,
            id_jabatan: id_jabatan,
            tmp_lhr: tmp_lhr,
            tgl_lhr: tgl_lhr,
            id_kab: id_kab,
            no_telepon: no_telepon,
            no_rekening: no_rekening,
            id_kemampuan: id_kemampuan,
          },
          {
            where: { uuid: req.params.uuid },
          }
        );
        responseHelper.updated(res);
      } else {
        responseHelper.notFound(res);
      }
    } catch (err) {
      res.status(400).json({ eror: err.message, stack: err.stack });
    }
  },
  karyawan_pulihkan_by_uuid: async (req, res) => {
    const data = await Karyawan.findOne({
      where: { uuid: req.params.uuid },
      attributes: ['uuid'],
    });

    try {
      if (data) {
        await Karyawan.update(
          {
            on: false,
          },
          {
            where: { uuid: data.uuid },
          }
        );
        await Absensi.update(
          {
            exp: true,
          },
          {
            where: {
              [Op.and]: [{ uuid_karyawan: req.params.uuid }, { time_end: null }],
            },
          }
        );
        responseHelper.updated(res);
      } else {
        responseHelper.notFound(res);
      }
    } catch (err) {
      res.status(400).json({ eror: err.message });
    }
  },
  karyawan_pulihkan_semua: async (req, res) => {
    const dateObject = new Date(req.params.tanggal);
    try {
      const data = await Karyawan.findAll({
        attributes: ['uuid', 'nama'],
        where: {
          [Op.and]: [
            { status_karyawan: 'Aktif' },
            { on: true },
            {
              id_jabatan: {
                [Op.not]: [1, 2],
              },
            },
          ],
        },
        include: [
          {
            model: Absensi,
            as: 'absensi',
            where: {
              [Op.and]: [
                {
                  tanggal: {
                    [Op.not]: dateObject,
                  },
                },
                // { time_end: null },
                { exp: false },
              ],
            },
            limit: 1,
            order: [['id', 'DESC']],
            required: true,
          },
        ],
      });

      const filteredData = data.filter((employee) => employee.absensi.length > 0);
      const uuidsToUpdate = filteredData.map((employee) => employee.uuid);

      await Karyawan.update(
        { on: false },
        {
          where: {
            uuid: { [Op.in]: uuidsToUpdate },
          },
        }
      );

      await Absensi.update(
        {
          exp: true,
        },
        {
          where: {
            [Op.and]: [
              {
                tanggal: {
                  [Op.not]: dateObject,
                },
              },
              { uuid_karyawan: { [Op.in]: uuidsToUpdate } },
              // { time_end: null },
            ],
          },
        }
      );
      responseHelper.updated(res);
    } catch (err) {
      res.status(400).json({ eror: err.message });
    }
  },
};
