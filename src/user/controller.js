'use strict';

const { Op } = require('sequelize');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const Karyawan = require('../../models/Karyawan');
const responseHelper = require('../../helpers/response-helper');
const Doc = require('../../models/Doc');
const Jabatan = require('../../models/Jabatan');
const Kabupaten = require('../../models/Kabupaten');
const Kemampuan = require('../../models/Kemampuan');
const Sequelize = require('sequelize');
const Lokasi = require('../../models/Lokasi');

module.exports = {
  login: async (req, res) => {
    try {
      const user = await Karyawan.findOne({
        attributes: ['uuid', 'email', 'password'],
        where: { email: req.body.email },
      });
      if (!user) return res.status(404).json({ msg: 'Email tidak terdaftar' });
      const password = user.password;
      const uuid = user.uuid;
      const email = user.email;
      const match = await bcrypt.compare(req.body.password, password);
      if (!match) return res.status(401).json({ msg: 'Password salah!' });
      const accessToken = jwt.sign({ uuid, email, password }, process.env.ACCESS_TOKEN_SECRET);
      const data = {
        uuid: uuid,
        email: email,
        accessToken: accessToken,
      };
      responseHelper.readSingleData(res, data);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  me: async (req, res) => {
    const user = jwt.verify(req.headers['x-access-token'], process.env.ACCESS_TOKEN_SECRET);
    const data = await Karyawan.findOne({
      attributes: [
        'uuid',
        'email',
        'password',
        'nama',
        'no_nik',
        'jk',
        'status_karyawan',
        'tgl_lhr',
        'no_telepon',
        'no_rekening',
        'id_jabatan',
        'id_kemampuan',
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
        [
          Sequelize.literal(`(
          SELECT s.nominal_bonus
          FROM statis AS s
          WHERE s.aktif = true
          )`),
          'nominal_bonus',
        ],
      ],
      include: [
        {
          model: Doc,
          as: 'doc',
          attributes: ['foto'],
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
          model: Lokasi,
          as: 'lokasi',
          attributes: ['nama', 'alamat', 'latitude', 'longitude', 'max_jarak', 'aktif'],
          where: {
            aktif: true,
          },
          nest: true,
        },
      ],
      where: {
        uuid: user.uuid,
      },
    });
    data ? responseHelper.readSingleData(res, data) : responseHelper.notFound(res);
  },
  getAllUserAktif: async (req, res) => {
    const search = req.query.search_query || '';
    try {
      const data = await Karyawan.findAll({
        attributes: ['uuid', 'nama', 'email', 'password'],
        where: {
          [Op.and]: [
            { status_karyawan: 'Aktif' },
            {
              [Op.or]: [
                {
                  nama: {
                    [Op.like]: '%' + search + '%',
                  },
                },
                {
                  email: {
                    [Op.like]: '%' + search + '%',
                  },
                },
              ],
            },
          ],
        },
        include: [
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
  getUserAktifByUuid: async (req, res) => {
    try {
      const data = await Karyawan.findOne({
        attributes: ['uuid', 'nama', 'email', 'password'],
        where: {
          [Op.and]: [{ status_karyawan: 'aktif' }, { uuid: req.params.uuid }],
        },
      });
      data ? responseHelper.readAllData(res, data) : responseHelper.notFound(res);
    } catch (err) {
      res.status(400).json(err.message);
    }
  },
  editUserByUuid: async (req, res) => {
    const { email, password } = req.body;
    const data = await Karyawan.findOne({
      where: { uuid: req.params.uuid },
      attributes: ['uuid'],
    });

    console.log(data);

    const salt = await bcrypt.genSalt();

    const hashPassword = await bcrypt.hash(password, salt);
    try {
      if (data) {
        await Karyawan.update(
          {
            email: email,
            password: hashPassword,
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
  gantiPasswordByUuid: async (req, res) => {
    const uuid = req.params.uuid;
    const user = await Karyawan.findOne({
      attributes: ['password', 'uuid'],
      where: {
        uuid: uuid,
      },
    });
    if (!user) return responseHelper.notFound(res);
    const match = await bcrypt.compare(req.body.password_lama, user.password);
    const salt = await bcrypt.genSalt();
    const hashPassword = await bcrypt.hash(req.body.password_baru, salt);
    if (!match) {
      return res.status(404).json({ msg: 'Password salah!' });
    } else {
      try {
        await Karyawan.update(
          {
            password: hashPassword,
          },
          { where: { uuid: user.uuid } }
        );
        responseHelper.updated(res);
      } catch (err) {
        // res.status(400).json(err.message);
        console.log(err.stack);
      }
    }
  },
};
