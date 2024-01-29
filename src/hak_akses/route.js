'use strict';

const express = require('express');
const { getAllHakAkses, updateByUuidHakAkses } = require('./controller.js');

const router = express.Router();
router.get('/hak_akses_get_all_karyawan', getAllHakAkses);
router.patch('/hak_akses_update_by_uuid/:uuid', updateByUuidHakAkses);

module.exports = router;
