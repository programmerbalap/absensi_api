'use strict';

const express = require('express');
const { toggleShift, updateStatis, getAll, getById, getShiftAktif } = require('./controller.js');

const router = express.Router();
router.get('/statis', getAll);
router.get('/statis/:id', getById);
router.patch('/statis/:id', updateStatis);
router.get('/statis_get_aktif', getShiftAktif);
router.patch('/statis_shift_toggle', toggleShift);

module.exports = router;
