'use strict';

const express = require('express');
const { getById, updateProfilById, updateInformasiById, updateLogoById, updateLokasiById, updateNominalBonusById, updateMinEfektifStartById } = require('./controller.js');
const { upload } = require('../../avatars/multer');

const router = express.Router();
router.get('/profil/:id', getById);
router.patch('/profil_update_by_id/:id', updateProfilById);
router.patch('/profil_update_lokasi_by_id/:id', updateLokasiById);
router.patch('/profil_update_nominal_bonus_by_id/:id', updateNominalBonusById);
router.patch('/profil_update_min_efektif_start_by_id/:id', updateMinEfektifStartById);
router.patch('/profil_upload_logo/:id', upload.single('file'), updateLogoById);
router.patch('/profil_informasi_update_by_id/:id', updateInformasiById);

module.exports = router;
