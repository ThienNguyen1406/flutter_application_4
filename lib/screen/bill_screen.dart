import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/bill_model.dart';
import 'package:flutter_application_4/provider/on_save_provider.dart';
import 'package:flutter_application_4/themes/app_images.dart';
import 'package:provider/provider.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key, required BillModel bill});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Image(
                image: AssetImage(AppImages.logoUC),
                height: 120,
                width: 120,
              ),
              const Text(
                "HÓA ĐƠN DỊCH VỤ",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Expanded(
            child: Consumer<OnSaveProvider>(
              builder: (context, provider, child) {
                final billData =
                    provider.billData; // Truy cập billData từ provider
                if (billData.maHoaDon == null || billData.maHoaDon!.isEmpty) {
                  return const Center(
                    child: Text(
                      "Không có mục nào trong hóa đơn!",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Mã hóa đơn: ${billData.maHoaDon}"),
                      subtitle: Text("Tên khách hàng: ${billData.hoTen}"),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(47, 179, 178, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Xác Nhận Hóa Đơn Thành Công!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(47, 179, 178, 1),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 120),
              ),
              child: const Text(
                "Xác Nhận Hóa Đơn",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
