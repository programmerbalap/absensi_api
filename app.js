const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors');
const dotenv = require('dotenv');
dotenv.config();
const db = require('./config/database.js');

const indexRouter = require('./src/index');
const userRoute = require('./src/user/route.js');
const statisRoute = require('./src/statis/route.js');
const jabatanRoute = require('./src/jabatan/route.js');
const gajiRoute = require('./src/gaji/route.js');
const kabupatenRoute = require('./src/kabupaten/route.js');
const dokumenRoute = require('./src/dokumen/route.js');
const absensiRoute = require('./src/absensi/route.js');
const AksesRoute = require('./src/akses/route.js');
const lokasiRoute = require('./src/lokasi/route.js');
const kemampuanRoute = require('./src/kemampuan/route.js');
const produksiRoute = require('./src/produksi/route.js');
const produkRoute = require('./src/produk/route.js');
const laporanRoute = require('./src/laporan/route.js');
const karyawanRoute = require('./src/karyawan/route.js');
const dashboardRoute = require('./src/dashboard/route.js');
const profilRoute = require('./src/profil/route.js');

const app = express();

const allowedOrigins = ['http://localhost:8081', 'http://localhost:8088', 'http://103.127.98.129'];

const corsOptions = {
  origin: (origin, callback) => {
    if (!origin || allowedOrigins.includes(origin)) {
      callback(null, true);
    } else {
      callback(new Error('Not allowed by CORS'));
    }
  },
  methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
  credentials: true,
};

app.use(cors(corsOptions));

// app.use(
//   cors({
//     credentials: true,
//     origin: ['http://localhost:8081', 'http://localhost:8088', 'http://103.127.98.129'],
//   })
// );

try {
  db.authenticate();
  console.log('Name :', db.config.database);
  console.log('User :', db.config.username);
  console.log('Pass :', db.config.password);
  console.log('Host :', db.config.host);
  console.log('Port :', db.config.port);
  console.log('Connect successfully.');
} catch (error) {
  console.error('Unable to connect to the database:', error);
}

const syncDatabase = async () => {
  try {
    await db.sync();
    console.log('Tables synced successfully.');
  } catch (error) {
    console.error('Unable to sync tables:', error);
  }
};
// async
// syncDatabase();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static('file'));

app.use('/', indexRouter);
app.use(userRoute);
app.use(statisRoute);
app.use(gajiRoute);
app.use(jabatanRoute);
app.use(kabupatenRoute);
app.use(dokumenRoute);
app.use(absensiRoute);
app.use(AksesRoute);
app.use(lokasiRoute);
app.use(kemampuanRoute);
app.use(produksiRoute);
app.use(produkRoute);
app.use(laporanRoute);
app.use(karyawanRoute);
app.use(dashboardRoute);
app.use(profilRoute);

module.exports = app;
