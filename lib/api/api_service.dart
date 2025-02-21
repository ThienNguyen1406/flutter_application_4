import 'package:dio/dio.dart';
import 'package:flutter_application_4/model/bill_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio dio = Dio();

  ApiService() {
    dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
  }

  Future<List<BillModel>> fetchBillData(String tuNgay, String denNgay) async {
    final data = {
      "sid": null,
      "cmd": "API_DanhSachKhachHang_Select",
      "data": {
        "benhnhan": {
          "TuNgay": tuNgay,
          "DenNgay": denNgay,
          "MaCoSo": "ND"
        }
      }
    };

    try {
      final response = await dio.post(
        'http://103.226.249.65:8081/api/AppService',
        data: data,
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        return (response.data["data"] as List)
            .map((e) => BillModel.fromJson(e))
            .toList();
      } else {
        throw Exception("Lỗi API: ${response.statusMessage} (${response.statusCode})");
      }
    } catch (e) {
      print("❌ Lỗi khi gọi API: $e");
      throw Exception("Lỗi API: $e");
    }
  }
}
