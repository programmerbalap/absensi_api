const express = require('express');
const { getAll, getPresentaseHariIni } = require('./controller');
const router = express.Router();

/* GET users listing. */
router.get('/persentase', getAll);
router.get('/persentase_hari_ini/:hari_ini', getPresentaseHariIni);

module.exports = router;
