const express = require('express');
const { login, me, getAllUserAktif, getUserAktifByUuid, editUserByUuid, gantiPasswordByUuid } = require('./controller');
const router = express.Router();

router.post('/login', login);
router.get('/me', me);
router.get('/user_get_all_aktif', getAllUserAktif);
router.get('/user_get_by_uuid/:uuid', getUserAktifByUuid);
router.patch('/user_update_by_uuid/:uuid', editUserByUuid);
router.patch('/user_ganti_password_by_uuid/:uuid', gantiPasswordByUuid);

module.exports = router;
