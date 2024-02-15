'use strict';

const { Op, Sequelize } = require('sequelize');
const responseHelper = require('../../helpers/response-helper');
const Karyawan = require('../../models/Karyawan');
const Jabatan = require('../../models/Jabatan');
const Absensi = require('../../models/Absensi');

module.exports = {
  getLaporanGaji: async (req, res) => {
    const search = req.query.search_query || '';
    const date = new Date();
    const dateOnly = date.toISOString().substring(0, 10);

    const yearDefault = dateOnly.split('-')[0];
    const monthDefault = dateOnly.split('-')[1];

    const year = req.query.year ? req.query.year : yearDefault;
    const month = req.query.month ? req.query.month : monthDefault;
    try {
      const data = await Karyawan.findAll({
        attributes: [
          'uuid',
          'no_nik',
          'nama',
          'jk',
          [
            Sequelize.literal(`(
                SELECT GROUP_CONCAT(DISTINCT a.kemampuan SEPARATOR ', ')
                FROM absensi AS a
                WHERE a.uuid_karyawan = karyawan.uuid
                AND a.hadir = 'Hadir'
                AND YEAR(a.tanggal) = ${year} AND MONTH(a.tanggal) = ${month})`),
            'kemampuan',
          ],
          [
            Sequelize.literal(`(
                SELECT COUNT(DISTINCT a.tanggal)
                FROM absensi AS a
                WHERE a.hadir = 'Hadir'
                AND YEAR(a.tanggal) = ${year} AND MONTH(a.tanggal) = ${month})`),
            'efektif_kerja',
          ],
          [
            Sequelize.literal(`(
                SELECT COUNT(DISTINCT a.tanggal)
                FROM absensi AS a
                WHERE a.uuid_karyawan = karyawan.uuid
                AND a.hadir = 'Hadir'
                AND YEAR(a.tanggal) = ${year} AND MONTH(a.tanggal) = ${month})`),
            'hadir',
          ],
          [
            Sequelize.literal(`(
                SELECT COUNT(DISTINCT a.tanggal)
                FROM absensi AS a
                WHERE a.uuid_karyawan = karyawan.uuid
                AND a.hadir = 'Tidak Hadir'
                AND YEAR(a.tanggal) = ${year}  AND MONTH(a.tanggal) = ${month} )`),
            'tidak',
          ],
          [
            Sequelize.literal(`(
                SELECT COUNT(DISTINCT a.tanggal)
                FROM absensi AS a
                WHERE a.uuid_karyawan = karyawan.uuid
                AND a.hadir = 'Hadir'
                AND a.bonus = true
                AND YEAR(a.tanggal) = ${year}  AND MONTH(a.tanggal) = ${month}
             )`),
            'bonus',
          ],
          [
            Sequelize.literal(`(
                SELECT COUNT(DISTINCT a.tanggal)
                FROM absensi AS a
                WHERE a.uuid_karyawan = karyawan.uuid
                AND a.hadir = 'Hadir'
                AND YEAR(a.tanggal) = ${year}  AND MONTH(a.tanggal) = ${month}
                AND a.shift = 'Normal')`),
            'normal',
          ],
          [
            Sequelize.literal(`(
                SELECT COUNT(DISTINCT a.tanggal)
                FROM absensi AS a
                WHERE a.uuid_karyawan = karyawan.uuid
                AND a.hadir = 'Hadir'
                AND YEAR(a.tanggal) = ${year}  AND MONTH(a.tanggal) = ${month}
                AND a.shift = 'Lembur')`),
            'lembur',
          ],
          [
            Sequelize.literal(`(
                SELECT ROUND(SUM(TIMESTAMPDIFF(MINUTE, a.time_start, a.time_end) * a.nominal_gaji / 60))
                FROM absensi AS a
                WHERE a.uuid_karyawan = karyawan.uuid
                AND a.hadir = 'Hadir'
                AND YEAR(a.tanggal) = ${year} AND MONTH(a.tanggal) = ${month}
                AND a.shift = 'Normal')`),
            'gaji_normal',
          ],
          [
            Sequelize.literal(`(
                SELECT
                  CASE
                    WHEN SUM(TIMESTAMPDIFF(MINUTE, a.time_start, a.time_end)) > 60 THEN (( FLOOR(SUM(TIMESTAMPDIFF(MINUTE, a.time_start, a.time_end)) / 60) * 2 * a.nominal_gaji )  - (a.nominal_gaji * 0.5) ) + (ROUND (SUM(TIMESTAMPDIFF(MINUTE, a.time_start, a.time_end)) % 60) * 2 * a.nominal_gaji / 60)
                    ELSE ROUND(SUM(TIMESTAMPDIFF(MINUTE, a.time_start, a.time_end) * a.nominal_gaji / 60 * 1.5))
                  END
                FROM absensi AS a
                WHERE a.uuid_karyawan = karyawan.uuid
                AND a.hadir = 'Hadir'
                AND YEAR(a.tanggal) = ${year}  AND MONTH(a.tanggal) = ${month}
                AND a.shift = 'Lembur')`),
            'gaji_lembur',
          ],
          // [
          //   Sequelize.literal(`(
          //     SELECT
          //       CASE
          //         WHEN SUM(TIMESTAMPDIFF(MINUTE, a.time_start, a.time_end)) > 60 THEN ((FLOOR(SUM(TIMESTAMPDIFF(MINUTE, a.time_start, a.time_end)) / 60) * 2 * a.nominal_gaji) - (a.nominal_gaji * 0.5)) + (ROUND(SUM(TIMESTAMPDIFF(MINUTE, a.time_start, a.time_end)) % 60) * 2 * a.nominal_gaji / 60)
          //         ELSE ROUND(SUM(TIMESTAMPDIFF(MINUTE, a.time_start, a.time_end) * a.nominal_gaji / 60 * 1.5))
          //       END
          //     FROM absensi AS a
          //     INNER JOIN karyawan ON a.uuid_karyawan = karyawan.uuid
          //     WHERE
          //       a.hadir = 'Hadir'
          //       AND YEAR(a.tanggal) = ${year}
          //       AND MONTH(a.tanggal) = ${month}
          //       AND a.shift = 'Lembur'
          //     // GROUP BY a.uuid_karyawan
          //   )`),
          //   'gaji_lembur',
          // ],
          [
            Sequelize.literal(`(
              SELECT a.nominal_bonus
              FROM absensi AS a
              WHERE a.uuid_karyawan = karyawan.uuid
              AND a.hadir = 'Hadir'
              AND YEAR(a.tanggal) = ${year} AND MONTH(a.tanggal) = ${month}
              LIMIT 1
              )`),
            'gaji_bonus',
          ],
          // GROUP BY a.tanggal
          [
            Sequelize.literal(`(
                SELECT TIME_FORMAT(SEC_TO_TIME(ROUND(SUM(TIMESTAMPDIFF(SECOND, a.time_start, a.time_end)))), '%H:%i:%s')
                FROM absensi AS a
                WHERE a.uuid_karyawan = karyawan.uuid
                AND a.hadir = 'Hadir'
                AND YEAR(a.tanggal) = ${year}  AND MONTH(a.tanggal) = ${month}
                AND a.shift = 'Lembur')`),
            'total_durasi_lembur',
          ],
          [
            Sequelize.literal(`(
                SELECT TIME_FORMAT(SEC_TO_TIME(ROUND(SUM(TIMESTAMPDIFF(SECOND, a.time_start, a.time_end)))), '%H:%i:%s')
                FROM absensi AS a
                WHERE a.uuid_karyawan = karyawan.uuid
                AND a.hadir = 'Hadir'
                AND YEAR(a.tanggal) = ${year}  AND MONTH(a.tanggal) = ${month}
                AND a.shift = 'Normal' )`),
            'total_durasi_normal',
          ],
        ],
        where: {
          [Op.and]: [{ id_jabatan: [3, 4] }, { status_karyawan: 'Aktif' }],
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
        include: [
          {
            model: Jabatan,
            as: 'jabatan',
            attributes: ['nama'],
          },
        ],
      });
      responseHelper.readAllData(res, data);
    } catch (err) {
      res.status(400).json(err.stack);
    }
  },

  getLaporanAbsensi: async (req, res) => {
    const search = req.query.search_query || '';
    const date = new Date();
    const dateOnly = date.toISOString().substring(0, 10);

    const yearDefault = dateOnly.split('-')[0];
    const monthDefault = dateOnly.split('-')[1];

    const year = req.query.year ? req.query.year : yearDefault;
    const month = req.query.month ? req.query.month : monthDefault;

    try {
      const data = await Karyawan.findAll({
        attributes: [
          'uuid',
          'no_nik',
          'nama',
          [
            Sequelize.literal(`(
          SELECT COUNT(DISTINCT a.tanggal)
          FROM absensi AS a
          WHERE a.uuid_karyawan = karyawan.uuid
          AND a.hadir = 'Hadir'
          AND YEAR(a.tanggal) = ${year}  AND MONTH(a.tanggal) = ${month})`),
            'hadir',
          ],
          // [
          //   Sequelize.literal(`(
          // SELECT COUNT(DISTINCT a.tanggal)
          // FROM absensi AS a
          // WHERE a.uuid_karyawan = Karyawan.uuid
          // AND a.hadir = 'Tidak Hadir'
          // AND YEAR(a.tanggal) = ${year}  AND MONTH(a.tanggal) = ${month})`),
          //   'tidak',
          // ],
        ],
        where: {
          [Op.and]: [{ id_jabatan: [3, 4] }, { status_karyawan: 'Aktif' }],
          [Op.or]: [
            {
              nama: {
                [Op.like]: '%' + search + '%',
              },
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
            model: Absensi,
            as: 'absensi',
            attributes: ['tanggal', 'hadir'],
            where: Sequelize.literal(`YEAR(tanggal) = ${year} AND MONTH(tanggal) = ${month}`),
            required: false,
          },
        ],
        // group: ['uuid_karyawan', 'absensi.tanggal'],
      });
      responseHelper.readAllData(res, data);
    } catch (err) {
      console.log(err.stack);
      res.status(400).json(err.stack);
    }
  },
};
