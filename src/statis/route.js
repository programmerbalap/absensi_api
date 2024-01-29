'use strict';

const express = require('express');
const { toggleShift, getStatis, updateStatis } = require('./controller.js');

const router = express.Router();
router.get('/statis', getStatis);
router.patch('/statis', updateStatis);
router.patch('/statis_shift_toggle', toggleShift);

module.exports = router;
