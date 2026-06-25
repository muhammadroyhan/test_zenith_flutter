import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_zenith/app/models/MBarang.dart';

class BarangController extends GetxController {
  var isLoading = false.obs;
  var barang = <BarangModel>[].obs;
  var filteredbarang = <BarangModel>[].obs;
  TextEditingController pencarianCtrl = TextEditingController();

  Future<void> getBarang() async {
    try {
      isLoading.value = true;
      http.Response response = await http.get(
        Uri.parse('http://192.168.1.81:8000/api/items'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        print(data);
        List<BarangModel> listBarang = data
            .map((e) => BarangModel.fromJson(e as Map<String, dynamic>))
            .toList();
        barang.assignAll(listBarang);
        filteredbarang.assignAll(listBarang);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void filterbarang(String query) {
    if (query.isEmpty) {
      filteredbarang.assignAll(barang);
    } else {
      var hasilfilter = barang.where((b) {
        return b.nama_barang.toLowerCase().contains(query.toLowerCase()) ||
            b.kode_barang.toLowerCase().contains(query.toLowerCase());
      }).toList();
      filteredbarang.assignAll(hasilfilter);
    }
  }

  @override
  void onInit() {
    getBarang();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pencarianCtrl.dispose();
    super.onClose();
  }
}
