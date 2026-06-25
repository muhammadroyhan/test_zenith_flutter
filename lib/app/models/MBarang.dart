class Barang {
  String message;
  BarangModel data;

  Barang({ required this.message, required this.data});

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      message: json['message'] ?? '',
      data: BarangModel.fromJson(json['data'] ?? {}),
    );
  }
}

class BarangModel {
  int id;
  String nama_barang;
  String kode_barang;
  int stok;

  BarangModel({
    required this.id,
    required this.nama_barang,
    required this.kode_barang,
    required this.stok,
  });

  factory BarangModel.fromJson(Map<String, dynamic> json) {
    return BarangModel(
      id: json['id'] ?? 0,
      nama_barang: json['nama_barang'] ?? '',
      kode_barang: json['kode_barang'] ?? '',
      stok: json['stok'] ?? '',
    );
  }
}
