'use strict';

const express = require('express');
const { getDataAbsensiByUser, presensi_check_in, presensi_check_out, getTimeEndNull, createPengajuanIzin, presensi_check_in_all, presensi_selesai, getDataAbsensi } = require('./controller.js');

const router = express.Router();
router.patch('/absensi_selesai', presensi_selesai);
router.post('/absensi_hadir_semua', presensi_check_in_all);
router.post('/absensi_presensi_check_in', presensi_check_in);
router.patch('/absensi_presensi_check_out/:id', presensi_check_out);
router.get('/absensi_time_end_null/:uuid', getTimeEndNull);
router.get('/absensi_get_by_user/:uuid', getDataAbsensiByUser);
router.get('/absensi_get_all', getDataAbsensi);
router.post('/absensi_pengajuan_izin', createPengajuanIzin);

module.exports = router;
