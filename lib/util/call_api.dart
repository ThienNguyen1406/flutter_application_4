import 'package:dio/dio.dart';
import 'package:flutter_application_4/model/bill_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CallApi {
  final List<BillModel> listBill = [];

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
      } else {
        throw Exception(
            "Failed to load bills: ${response.statusMessage} (${response.statusCode})");
      }
    } catch (e) {
      print("Error occurred while fetching bill data: $e");
      rethrow;
    }
  }
}
