'use strict';

const express = require('express');
const router = express.Router();
const { getById, getAll, updateFotoMeByUUid, updateFotoById } = require('./controller');
const { upload } = require('../../avatars/multer');

router.get('/doc', getAll);
router.get('/doc/:id', getById);
router.patch('/doc_foto_by_uuid/:uuid', upload.single('file'), updateFotoById);
router.patch('/doc_foto_me_by_uuid/:uuid', upload.single('file'), updateFotoMeByUUid);

module.exports = router;
