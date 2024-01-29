const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, './file/');
  },

  filename: function (req, file, cb) {
    let exsistensi = path.extname(file.originalname);
    cb(null, 'STG-' + Date.now() + (Date.now() - 20) + exsistensi);
  },
});

const filter = (req, file, cb) => {
  let exsistensi = file.mimetype;
  exsistensi.toLowerCase();

  if (exsistensi == 'image/jpg' || exsistensi == 'image/jpeg' || exsistensi == 'image/png') {
    cb(null, true);
  } else {
    cb({ msg: 'Unsuport format file!' }, false);
  }
};

module.exports = {
  upload: multer({
    storage: storage,
    limits: {
      fileSize: 2 * 1024 * 1024,
    },
    fileFilter: filter,
  }),
};
