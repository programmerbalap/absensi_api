const { users } = require('../database/models');
const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');
dotenv.config();

const verifyUser = async (req, res, next) => {
  const token = req.headers['x-access-token'];

  if (!token) {
    return res.status(401).json({ msg: 'Token tidak diberikan. Mohon login dulu!' });
  }

  const user_r = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);

  if (!user_r) {
    return res.status(401).json({ msg: 'Token tidak valid atau telah kedaluwarsa. Mohon login dulu!' });
  }

  const data = await users.findOne({
    where: {
      id: user_r.id,
    },
  });
  if (!data) return res.status(404).json({ msg: 'User not found!' });
  next();
};

const adminOnly = async (req, res, next) => {
  const users = jwt.verify(req.headers['x-access-token'], process.env.ACCESS_TOKEN_SECRET);
  const data = await users.findOne({
    where: {
      id: users.id,
    },
  });
  //   Cek apakah tidak cocok?
  if (!data) return res.status(404).json({ msg: 'User not found!' });
  if (data.email !== 'admin@gmail.com') return res.status(403).json({ msg: 'Akses terlarang!' });
  next();
};

module.exports = { adminOnly, verifyUser };
