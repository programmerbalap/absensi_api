'use strict';

const express = require('express');
const {
  getDataAbsensiByUser,
  presensi_check_in,
  presensi_check_out,
  presensi_check_in_all,
  presensi_selesai,
  getAbsensiLastByUser,
  getDataAbsensi,
  presensi_selesai_no_lokasi,
  presensi_check_in_all_no_lokasi,
  presensi_check_out_no_lokasi,
  presensi_check_in_no_lokasi,
  presensi_user_izin,
  presensi_user_hadir,
  presensi_user_hadir_no_lokasi,
  getDataAbsensiById,
  presensi_tambah,
  deleteAbsensiById,
  presensi_update,
} = require('./controller.js');

const router = express.Router();
router.patch('/absensi_selesai', presensi_selesai);
router.patch('/absensi_selesai_no_lokasi', presensi_selesai_no_lokasi);
router.post('/absensi_hadir_semua', presensi_check_in_all);
router.post('/absensi_hadir_semua_no_lokasi', presensi_check_in_all_no_lokasi);
router.post('/absensi_presensi_check_in', presensi_check_in);
router.post('/absensi_presensi_check_in_no_lokasi', presensi_check_in_no_lokasi);
router.patch('/absensi_presensi_check_out/:id', presensi_check_out);
router.patch('/absensi_presensi_check_out_no_lokasi/:id', presensi_check_out_no_lokasi);

router.post('/absensi_user_hadir', presensi_user_hadir);
router.post('/absensi_user_hadir_no_lokasi', presensi_user_hadir_no_lokasi);
router.post('/absensi_pengajuan_izin', presensi_user_izin);
router.post('/absensi_tambah', presensi_tambah);
router.delete('/absensi_hapus/:id', deleteAbsensiById);
router.patch('/absensi_update/:id', presensi_update);

router.get('/absensi_last_by_user/:uuid', getAbsensiLastByUser);
router.get('/absensi_get_by_user/:uuid', getDataAbsensiByUser);
router.get('/absensi_get_all', getDataAbsensi);
router.get('/absensi_get_by_id/:id', getDataAbsensiById);

module.exports = router;
