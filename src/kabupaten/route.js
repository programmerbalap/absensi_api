'use strict';

const express = require('express');
const { getAll, generate } = require('./controller.js');

const router = express.Router();
router.get('/kabupaten', getAll);
router.get('/generate', generate);

module.exports = router;
