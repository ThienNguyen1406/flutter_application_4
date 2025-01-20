import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/bill_model.dart';
import 'package:flutter_application_4/screen/bill_screen.dart';
import 'package:flutter_application_4/themes/app_images.dart';
import 'package:flutter_application_4/widget/bassic_text_input.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class InputBillScreen extends StatefulWidget {
  const InputBillScreen({super.key});
  @override
  State<InputBillScreen> createState() => _InputBillScreenState();
}

class _InputBillScreenState extends State<InputBillScreen> {
  List<BillModel> listBill = [];
  TextEditingController billController = TextEditingController();

  Future<void> fetchBillData() async {
    final dio = Dio();
    final data = {
      "sid": null,
      "cmd": "API_DanhSachKhachHang_Select",
      "data": {
        "benhnhan": {
          "TuNgay": "01/01/2024",
          "DenNgay": "02/01/2024",
          "MaCoSo": "ND"
        }
      }
    };

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );

    try {
      final response = await dio.post(
        'http://103.226.249.65:8081/api/AppService',
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        List<BillModel> listBill = [];
        for (var e in response.data) {
          listBill.add(BillModel.fromJson(e));
        }
        print(listBill.length);
        final bill = listBill.firstWhere(
          (e) => e.maHoaDon == billController.text.trim(),
          orElse: () => BillModel(),
        );

        if (bill != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BillScreen(bill: bill),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text("Hóa đơn không tìm thấy")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Lỗi: ${response.statusMessage}")),
        );
      }
    } catch (e) {
      // Log chi tiết lỗi
      print('Error occurred: $e');
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
                fetchBillData();
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
