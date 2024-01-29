'use strict';

const express = require('express');
const { getAll, getById, deleteById, updateById, create } = require('./controller.js');

const router = express.Router();
router.get('/jabatan', getAll);
router.patch('/jabatan/:id', updateById);
router.get('/jabatan/:id', getById);
router.delete('/jabatan/:id', deleteById);
router.post('/jabatan', create);

module.exports = router;
