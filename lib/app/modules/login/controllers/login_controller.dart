import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginFormKey = GlobalKey<FormState>();

  final TextEditingController EmailCtrl = TextEditingController();
  final TextEditingController PassCtrl = TextEditingController();

  final String email = 'sales@gmail.com';
  final String pass = 'Password123!';

  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  String? validateEmail(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Email tidak boleh kosong';
    }
    if (value.contains(' ') ||
        value.contains('  ') ||
        !value.contains('@') ||
        !value.contains('.') ||
        !GetUtils.isEmail(value)) {
      return 'Masukan email dengan benar';
    }
    {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Kata sandi tidak boleh kosong';
    }
    if (value.length < 6) {
      return "Minimal 6 karakter";
    }
    if (!RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
    ).hasMatch(value)) {
      return 'Minimal 1 huruf besar, kecil, angka, dan karakter spesial';
    }
    return null;
  }

  void checkMasuk() async {
    if (LoginFormKey.currentState!.validate()) {
      LoginFormKey.currentState!.save();
      try {
        if (EmailCtrl.text.trim() == email && PassCtrl.text == pass) {
          Get.offAllNamed('/dashboard');
        } else {
          Get.snackbar(
            snackPosition: SnackPosition.TOP,
            "Login Gagal",
            'Email atau Password Salah!',
            colorText: Colors.white,
            backgroundColor: Colors.red,
          );
        }
      } catch (e) {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Login Gagal",
          'Email atau Password Salah!',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    EmailCtrl.dispose();
    PassCtrl.dispose();
    super.onClose();
  }
}
