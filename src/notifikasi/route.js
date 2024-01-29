'use strict';

const express = require('express');
const { getAll, getById, deleteById, updateById, create } = require('./controller.js');

const router = express.Router();
router.get('/notif', getAll);
router.get('/notif/:id', getById);
router.delete('/notif/:id', deleteById);
router.patch('/notif/:id', updateById);
router.post('/notif', create);

module.exports = router;
