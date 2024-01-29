const express = require('express');
const { getLaporanAbsensi, getLaporanGaji } = require('./controller');
// const { verifyUser } = require('../../middleware/middleware');
const router = express.Router();

/* GET users listing. */
router.get('/laporan_absensi', getLaporanAbsensi);
router.get('/laporan_gaji', getLaporanGaji);

module.exports = router;
