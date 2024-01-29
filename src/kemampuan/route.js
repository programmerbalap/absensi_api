'use strict';

const express = require('express');
const { getAll, getById, deleteById, updateById, create } = require('./controller.js');

const router = express.Router();
router.get('/kemampuan', getAll);
router.get('/kemampuan/:id', getById);
router.delete('/kemampuan/:id', deleteById);
router.patch('/kemampuan/:id', updateById);
router.post('/kemampuan', create);

module.exports = router;
