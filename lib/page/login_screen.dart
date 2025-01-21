import 'package:flutter/material.dart';
import 'package:flutter_application_4/screen/action_sceen.dart';
import 'package:flutter_application_4/screen/bill_screen.dart';
import 'package:flutter_application_4/screen/input_bill_screen.dart';
import 'package:flutter_application_4/screen/vote_screen.dart';
import 'package:flutter_application_4/themes/app_images.dart';
import 'package:flutter_application_4/widget/bassic_text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 4, child: Image(image: AssetImage(AppImages.logoUC))),
            Expanded(
              flex: 1,
              child: BasicTextInput(
                title: 'Tên đăng nhập',
                editingController: usernameController,
              ),
            ),
            Expanded(
              flex: 1,
              child: BasicTextInput(
                title: 'Mật Khẩu',
                editingController: passwordController,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputBillScreen(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 140),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(47, 179, 178, 1),
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
