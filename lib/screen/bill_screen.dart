import 'package:flutter/material.dart';
import 'package:flutter_application_4/provider/on_save_provider.dart';
import 'package:flutter_application_4/screen/action_sceen.dart';
import 'package:flutter_application_4/themes/app_images.dart';
import 'package:provider/provider.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

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
                final billData = provider.billData;
                if (billData == null ||
                    billData.maHoaDon == null ||
                    billData.maHoaDon!.isEmpty) {
                  return const Center(
                    child: Text(
                      "Không có mục nào trong hóa đơn!",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
                return ListView(
                  children: [
                    ListTile(
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mã hóa đơn: ${billData.maHoaDon}"),
                          SizedBox(height: 10),
                          Text("Tên khách hàng: ${billData.hoTen}"),
                          SizedBox(height: 10),
                          Text("Mã khách hàng: ${billData.maBenhNhan}"),
                          SizedBox(height: 10),
                          Text("Mã cơ sở: ${billData.maCoSo}"),
                          SizedBox(height: 10),
                          Text("Địa chỉ: ${billData.coSoKham}"),
                          SizedBox(height: 10),
                          Text("Bác sĩ phụ trách: ${billData.bacSyPhuTrach}"),
                          SizedBox(height: 10),
                          Text("Tên dịch vụ: ${billData.tenDichVu}"),
                          SizedBox(height: 10),
                          Text("Số lượng: ${billData.soLuong}"),
                          SizedBox(height: 10),
                          Text("Đơn giá: ${billData.donGia}"),
                          SizedBox(height: 10),
                          Text("Điện thoại: ${billData.dienThoaiDD}"),
                          SizedBox(height: 10),
                          Text("Thời gian khám: ${billData.thoiGianKham}"),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                final provider =
                    Provider.of<OnSaveProvider>(context, listen: false);
                provider.updateBillData(provider.billData!);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActionSceen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(47, 179, 178, 1),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 110),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text(
                "Xác Nhận Hóa Đơn",
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
