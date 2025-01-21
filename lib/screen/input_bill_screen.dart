import 'package:flutter/material.dart';
import 'package:flutter_application_4/themes/app_images.dart';
import 'package:flutter_application_4/util/call_api.dart';
import 'package:flutter_application_4/widget/bassic_text_input.dart';

import 'bill_screen.dart';

class InputBillScreen extends StatefulWidget {
  const InputBillScreen({super.key});

  @override
  State<InputBillScreen> createState() => _InputBillScreenState();
}

class _InputBillScreenState extends State<InputBillScreen> {
  TextEditingController billController = TextEditingController();

  // Gọi API từ CallApi
  Future<void> fetchBillData() async {
    try {
      final callApi = CallApi();
      await callApi.fetchBillData();

      // Tìm hóa đơn theo mã
      final bill = callApi.listBill.firstWhere(
        (e) => e.maHoaDon == billController.text.trim(),
      );

      if (bill != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BillScreen(bill: bill),
          ),
        );
      } else {
        // Hiển thị thông báo nếu không tìm thấy
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Hóa đơn không tìm thấy!")),
        );
      }
    } catch (e) {
      // Hiển thị lỗi nếu gọi API thất bại
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lỗi khi gọi API: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(AppImages.logoUC)),
          const SizedBox(height: 150),
          BasicTextInput(
            title: "Nhập mã hóa đơn",
            editingController: billController,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              if (billController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Vui lòng nhập mã hóa đơn!")),
                );
              } else {
                fetchBillData(); // Gọi API khi nút được nhấn
              }
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 130),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(47, 179, 178, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "Xem hóa đơn",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
