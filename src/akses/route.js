'use strict';

const express = require('express');
const { create, getAll, updateByUuid } = require('./controller.js');

const router = express.Router();
router.get('/akses_get_all', getAll);
router.patch('/akses_update_by_uuid/:uuid', updateByUuid);
router.post('/akses_create', create);

module.exports = router;
