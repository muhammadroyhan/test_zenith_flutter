import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/barang_controller.dart';

class BarangView extends GetView<BarangController> {
  const BarangView({super.key});

  @override
  Widget build(BuildContext context) {
    final BarangController barangController = Get.put(BarangController());

    final List<String> imgList = [
      'assets/paracetamol.png',
      'assets/amoxcillin.png',
      'assets/vitC.png',
      'assets/omeprazole.png',
      'assets/cetirizine.png',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(
            top: 50,
            left: 24,
            right: 24,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const FaIcon(
                      FontAwesomeIcons.angleLeft,
                      color: Colors.cyan,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    'Master Barang',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: barangController.pencarianCtrl,
                onChanged: (value) {
                  barangController.filterbarang(value);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: barangController.pencarianCtrl,
                    builder: (context, value, child) {
                      return value.text.isEmpty
                          ? const SizedBox()
                          : IconButton(
                              onPressed: () {
                                barangController.pencarianCtrl.clear();
                                barangController.filterbarang('');
                              },
                              icon: const Icon(Icons.clear),
                            );
                    },
                  ),
                  hintText: 'Cari Kode / Nama Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(80, 24, 255, 255),
                ),
              ),
              Obx(() {
                if (barangController.isLoading.value) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (barangController.filteredbarang.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Center(
                      child: Text(
                        'Barang tidak ditemukan',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: barangController.filteredbarang.length,
                  itemBuilder: (context, index) {
                    var barang = barangController.filteredbarang[index];
                    var imgAsset = index < imgList.length
                        ? imgList[index]
                        : imgList[0];

                    return GestureDetector(
                      onTap: () {
                        final selctedId = barang.id;
                        print(selctedId);
                        Get.toNamed('/detail-barang', arguments: barang.id);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.cyan.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              imgAsset,
                              height: 60,
                              width: 60,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.medication,
                                  size: 60,
                                  color: Colors.grey,
                                );
                              },
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    barang.nama_barang,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    barang.kode_barang,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
