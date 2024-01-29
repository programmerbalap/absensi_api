'use strict';

const express = require('express');
const router = express.Router();
const { getById, updateById, getAll } = require('./controller');
const { upload } = require('../../avatars/multer');

router.get('/doc', getAll);
router.get('/doc/:id', getById);
router.patch('/doc/:uuid', upload.single('file'), updateById);

module.exports = router;
