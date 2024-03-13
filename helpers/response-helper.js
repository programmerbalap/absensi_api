module.exports = {
  readPagination: (res, page, limit, data, filter) => {
    res.status(200).json({
      code: 200,
      page: page,
      limit: limit,
      data: data,
      filter: filter,
    });
  },
  readAllData: (res, data) => {
    res.status(200).json({
      code: 200,
      msg: 'Setup All Data Berhasil',
      data: data,
    });
  },
  readSingleData: (res, data) => {
    res.status(200).json({
      code: 200,
      msg: 'Setup Single Data Berhasil',
      data: data,
    });
  },
  created: (res, data) => {
    res.status(201).json({
      code: 201,
      msg: 'Data telah ditambahkan!',
      data: data,
    });
  },
  updated: (res) => {
    res.status(200).json({
      code: 200,
      msg: 'Data telah diubah!',
    });
  },
  deleted: (res) => {
    res.status(204).json({
      code: 204,
      msg: 'Data telah dihapus!',
    });
  },
  serverError: (res) => {
    res.status(500).json({
      code: 500,
      msg: 'Server error!',
    });
  },
  notFound: (res) => {
    res.status(404).json({
      code: 404,
      msg: 'Data tidak ditemukan!',
    });
  },
  notValid: (res) => {
    res.status(422).json({
      code: 422,
      msg: 'Data tidak valid!',
    });
  },
  badRequest: (res) => {
    res.status(400).json({
      code: 400,
      msg: 'Request Gagal!',
    });
  },
  syncGenerate: (res) => {
    res.status(201).json({
      code: 201,
      msg: 'Generate success!',
    });
  },
};
