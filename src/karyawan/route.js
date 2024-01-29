const express = require('express');
const {
  karyawan_get_check_in,
  Karyawan_get_checkOut,
  karyawan_get_all_aktif,
  karyawan_get_all_non_aktif,
  karyawan_set_status,
  karyawan_tambah,
  karyawan_delete_by_uuid,
  karyawan_get_by_uuid,
  karyawan_update_by_uuid,
  Karyawan_get_pemulihan,
  karyawan_pulihkan_by_uuid,
  karyawan_pulihkan_semua,
} = require('./controller');
const router = express.Router();

router.get('/karyawan_get_all_aktif', karyawan_get_all_aktif);
router.get('/karyawan_get_all_non_aktif', karyawan_get_all_non_aktif);
router.get('/karyawan_get_check_in', karyawan_get_check_in);
router.get('/karyawan_get_check_out', Karyawan_get_checkOut);
router.get('/karyawan_get_pemulihan', Karyawan_get_pemulihan);
router.patch('/karyawan_pulihkan_by_uuid/:uuid', karyawan_pulihkan_by_uuid);
router.patch('/karyawan_pulihkan_semua/:tanggal', karyawan_pulihkan_semua);
router.get('/karyawan_get_by_uuid/:uuid', karyawan_get_by_uuid);
router.post('/karyawan_tambah', karyawan_tambah);
router.patch('/karyawan_set_status/:uuid', karyawan_set_status);
router.delete('/karyawan_delete_by_uuid/:uuid', karyawan_delete_by_uuid);
router.patch('/karyawan_update_by_uuid/:uuid', karyawan_update_by_uuid);

module.exports = router;
