'use strict';

const express = require('express');
const { getInformasiPenggajian, getAll, updateById, getById, deleteById, create } = require('./controller.js');

const router = express.Router();

router.get('/gaji_get_informasi_penggajian', getInformasiPenggajian);
router.get('/gaji', getAll);
router.patch('/gaji/:id', updateById);
router.get('/gaji/:id', getById);
router.delete('/gaji/:id', deleteById);
router.post('/gaji', create);

module.exports = router;
