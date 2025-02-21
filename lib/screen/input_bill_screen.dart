import 'package:flutter/material.dart';
import 'package:flutter_application_4/api/api_service.dart';
import 'package:flutter_application_4/provider/on_save_provider.dart';
import 'package:flutter_application_4/screen/bill_screen.dart';
import 'package:flutter_application_4/themes/app_images.dart';
import 'package:flutter_application_4/widget/bassic_text_input.dart';
import 'package:flutter_application_4/model/bill_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InputBillScreen extends StatefulWidget {
  const InputBillScreen({super.key});

  @override
  State<InputBillScreen> createState() => _InputBillScreenState();
}

class _InputBillScreenState extends State<InputBillScreen> {
  final ApiService apiService = ApiService();
  final List<BillModel> listBill = [];
  final TextEditingController billController = TextEditingController();
  DateTime? tuNgay;
  DateTime? denNgay;

  @override
  void dispose() {
    billController.dispose();
    super.dispose();
  }

  Future<void> _selectDate({required bool isStartDate}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate:
          isStartDate ? tuNgay ?? DateTime.now() : denNgay ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          tuNgay = pickedDate;
        } else {
          denNgay = pickedDate;
        }
      });
    }
  }

  Future<void> fetchBillData() async {
    if (tuNgay == null || denNgay == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("⚠️ Vui lòng chọn đầy đủ ngày!")),
      );
      return;
    }

    final String formattedTuNgay = DateFormat('dd/MM/yyyy').format(tuNgay!);
    final String formattedDenNgay = DateFormat('dd/MM/yyyy').format(denNgay!);

    try {
      final bills =
          await apiService.fetchBillData(formattedTuNgay, formattedDenNgay);
      setState(() {
        listBill.clear();
        listBill.addAll(bills);
      });

      final String inputBill = billController.text.trim();
      if (inputBill.isNotEmpty) {
        final bill = listBill.firstWhere(
          (e) => e.maHoaDon == inputBill,
        );

        if (bill != null) {
          Provider.of<OnSaveProvider>(context, listen: false)
              .updateBillData(bill);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BillScreen(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("❌ Hóa đơn không tìm thấy!")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("✅ Đã tải ${listBill.length} hóa đơn!")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Lỗi khi tải dữ liệu: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 4, child: Image.asset(AppImages.logoUC)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(isStartDate: true),
                  child: Text(tuNgay == null
                      ? "Chọn Bắt Đầu"
                      : "Từ: ${DateFormat('dd/MM/yyyy').format(tuNgay!)}"),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(isStartDate: false),
                  child: Text(denNgay == null
                      ? "Chọn Chọn Ngày Kết Thúc"
                      : "Đến: ${DateFormat('dd/MM/yyyy').format(denNgay!)}"),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  width: MediaQuery.of(context).size.width,
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
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
