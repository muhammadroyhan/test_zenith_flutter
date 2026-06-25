import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_barang_controller.dart';

class DetailBarangView extends GetView<DetailBarangController> {
  const DetailBarangView({super.key});
  @override
  Widget build(BuildContext context) {
    final DetailBarangController detailBarangController = Get.put(
      DetailBarangController(),
    );
    final Height = MediaQuery.of(context).size.height;
    return GetBuilder<DetailBarangController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Obx(() {
              final imagePath = detailBarangController.getImageById(
                detailBarangController.barang.value.data.id,
              );
              return Container(
                height: Height,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: FaIcon(
                            FontAwesomeIcons.angleLeft,
                            color: Colors.cyan,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Detail Barang',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: BoxBorder.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              imagePath == null
                                  ? const Icon(Icons.medication, size: 80)
                                  : Image.asset(
                                      imagePath,
                                      height: 120,
                                      width: 120,
                                    ),
                              SizedBox(width: 16),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detailBarangController
                                        .barang
                                        .value
                                        .data
                                        .nama_barang,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    detailBarangController
                                        .barang
                                        .value
                                        .data
                                        .kode_barang,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                    Text(
                      'Informasi Barang',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.cyanAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          informasi_barang(
                            text: 'Kode Barang',
                            detailBarangController: detailBarangController,
                            data:
                                '${detailBarangController.barang.value.data.kode_barang}',
                          ),
                          informasi_barang(
                            detailBarangController: detailBarangController,
                            text: 'Nama Barang',
                            data:
                                '${detailBarangController.barang.value.data.nama_barang}',
                          ),
                          informasi_barang(
                            detailBarangController: detailBarangController,
                            text: 'Kategori',
                            data: 'Obat Bebas',
                          ),
                          informasi_barang(
                            detailBarangController: detailBarangController,
                            text: 'Satuan',
                            data: 'Tablet',
                          ),
                          informasi_barang(
                            detailBarangController: detailBarangController,
                            text: 'Stok saat ini',
                            data:
                                '${detailBarangController.barang.value.data.stok}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class informasi_barang extends StatelessWidget {
  const informasi_barang({
    super.key,
    required this.detailBarangController,
    required this.text,
    required this.data,
  });

  final DetailBarangController detailBarangController;
  final String text;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Text(
            data,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.cyanAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
