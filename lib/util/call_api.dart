import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/bill_model.dart';
import 'package:flutter_application_4/screen/bill_screen.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CallApi {
  final List<BillModel> listBill = [];
  final TextEditingController billController;
  final BuildContext context;

  CallApi({required this.billController, required this.context});

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

      if (response.statusCode == 200 && response.data is List) {
        listBill.clear();
        for (var e in response.data) {
          listBill.add(BillModel.fromJson(e));
        }

        final bill = listBill.firstWhere(
          (e) => e.maHoaDon == billController.text.trim(),
          orElse: () => BillModel(),
        );

        if (bill.maHoaDon != null && bill.maHoaDon!.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BillScreen(bill: bill),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Hóa đơn không tìm thấy")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Lỗi: ${response.statusMessage}")),
        );
      }
    } catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lỗi khi gọi API: $e")),
      );
    }
  }
}
