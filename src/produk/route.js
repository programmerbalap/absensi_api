'use strict';

const express = require('express');
const { getAll, getById, deleteById, updateById, create } = require('./controller.js');

const router = express.Router();
router.get('/produk', getAll);
router.patch('/produk/:id', updateById);
router.get('/produk/:id', getById);
router.delete('/produk/:id', deleteById);
router.post('/produk', create);

module.exports = router;
