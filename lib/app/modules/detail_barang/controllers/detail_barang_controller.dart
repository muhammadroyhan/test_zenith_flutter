import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_zenith/app/models/MBarang.dart';
import 'package:http/http.dart' as http;

class DetailBarangController extends GetxController {
  var isLoading = false.obs;
  Rx<Barang> barang = Barang(
    message: '',
    data: BarangModel(id: 0, nama_barang: '', kode_barang: '', stok: 0),
  ).obs;

  Future<void> getDetailBarang(id) async {
    try {
      http.Response response = await http.get(
        Uri.parse('http://192.168.1.81:8000/api/items/${id}'),
      );
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body)['data'];
        print(json);
        barang.value = Barang(
          message: '',
          data: BarangModel(
            id: json['id'] ?? 0,
            kode_barang: json['kode_barang'] ?? '',
            nama_barang: json['nama_barang'] ?? '',
            stok: json['stok'] ?? 0,
          ),
        );
        barang.refresh();
      }
    } catch (e) {
      print('error');
      print(e);
    }
  }

  String? getImageById(int id) {
  const imageMap = {
    1: 'assets/paracetamol.png',
    2: 'assets/amoxcillin.png',
    3: 'assets/vitC.png',
    4: 'assets/omeprazole.png',
    5: 'assets/cetirizine.png',
  };

  return imageMap[id];
}

  @override
  void onInit() {
    final dataId = Get.arguments;
    getDetailBarang(dataId);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
