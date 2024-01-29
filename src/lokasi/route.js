'use strict';

const express = require('express');
const { getAll, getById, deleteById, updateById, getAllKaryawanLokasi, getAllLokasiByUUID, getLokasiById, addLokasi, setAktifById } = require('./controller.js');

const router = express.Router();
router.get('/lokasi_get_all_karyawan_lokasi', getAllKaryawanLokasi);
router.post('/lokasi_add', addLokasi);
router.patch('/lokasi_set_aktif', setAktifById);
router.patch('/lokasi_edit_by_id', updateById);

router.get('/data_lokasi_by_uuid/:uuid', getAllLokasiByUUID);
router.get('/lokasi_by_id/:id', getLokasiById);
router.get('/lokasi', getAll);
router.get('/lokasi/:id', getById);
router.delete('/lokasi/:id', deleteById);

module.exports = router;
