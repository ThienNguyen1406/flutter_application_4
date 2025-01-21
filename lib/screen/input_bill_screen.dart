import 'package:flutter/material.dart';
import 'package:flutter_application_4/themes/app_images.dart';
import 'package:flutter_application_4/util/call_api.dart';
import 'package:flutter_application_4/widget/bassic_text_input.dart';

class InputBillScreen extends StatefulWidget {
  const InputBillScreen({super.key});

  @override
  State<InputBillScreen> createState() => _InputBillScreenState();
}

class _InputBillScreenState extends State<InputBillScreen> {
  TextEditingController billController = TextEditingController();

  void fetchBillData() {
    CallApi callApi = CallApi(
      billController: billController,
      context: context,
    );
    callApi.fetchBillData();
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
