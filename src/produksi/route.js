'use strict';

const express = require('express');
const { getAll, getById } = require('./controller.js');

const router = express.Router();
router.get('/produksi', getAll);
router.get('/produksi/:id', getById);

module.exports = router;
