import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: Height,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dashboard',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.notifications, color: Colors.cyan, size: 30),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                width: double.infinity,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color.fromARGB(80, 24, 255, 255),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.shieldHalved,
                      color: Colors.grey,
                      size: 50,
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pharmasi Zenith',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Selamat Datang, Rayhan',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Ringkasan Hari ini',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.6,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildSummaryCard(
                    '150',
                    'Total Barang',
                    FontAwesomeIcons.box,
                    Colors.cyan,
                  ),
                  _buildSummaryCard(
                    '56',
                    'Penjualan',
                    FontAwesomeIcons.shoppingCart,
                    Colors.cyan,
                  ),
                  _buildSummaryCard(
                    '23',
                    'Stok barang',
                    FontAwesomeIcons.boxesPacking,
                    Colors.cyan,
                  ),
                ],
              ),
              Text(
                'Menu Utama',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GridView.count(
                padding: const EdgeInsets.symmetric(vertical: 8),
                crossAxisCount: 3,
                childAspectRatio: 1.1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildMenuItem(FontAwesomeIcons.userGroup, 'Customer', () {
                    // Handle menu item tap
                  }),
                  _buildMenuItem(FontAwesomeIcons.box, 'Barang', () {
                    Get.toNamed('/barang');
                  }),
                  _buildMenuItem(FontAwesomeIcons.cartShopping, 'Sales', () {
                    // Handle menu item tap
                  }),
                  _buildMenuItem(FontAwesomeIcons.download, 'Stok Masuk', () {
                    // Handle menu item tap
                  }),
                  _buildMenuItem(FontAwesomeIcons.shoppingBag, 'Penjualan', () {
                    // Handle menu item tap
                  }),
                  _buildMenuItem(FontAwesomeIcons.fileInvoice, 'Laporan', () {
                    // Handle menu item tap
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSummaryCard(
  String value,
  String title,
  FaIconData icon,
  Color color,
) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Color.fromARGB(80, 24, 255, 255),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        FaIcon(icon, size: 26, color: color),
      ],
    ),
  );
}

Widget _buildMenuItem(FaIconData icon, String title, VoidCallback onTap) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: InkWell(
      onTap: onTap,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, size: 30, color: Colors.cyan),
            SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
