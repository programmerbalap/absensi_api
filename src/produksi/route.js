'use strict';

const express = require('express');
const { getAll, getById, create, updateById, deleteById, setujuiById, getAllProduksiByUser, updateByIdProduksiByUser } = require('./controller.js');

const router = express.Router();
router.get('/produksi_get_all_by_user/:uuid', getAllProduksiByUser);
router.patch('/produksi_user_edit/:id', updateByIdProduksiByUser);
router.get('/produksi/:id', getById);
router.post('/produksi_tambah', create);
router.get('/produksi', getAll);
router.patch('/produksi_edit/:id', updateById);
router.patch('/produksi_setujui/:id', setujuiById);
router.delete('/produksi_hapus/:id', deleteById);

module.exports = router;
