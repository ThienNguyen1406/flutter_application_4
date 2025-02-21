import 'package:flutter/material.dart';
import 'package:flutter_application_4/themes/app_images.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 80),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.anh4), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Text(
              "CẢM ƠN QUÝ KHÁCH",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(
                    47, 179, 178, 1), 
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Đã tham gia đánh giá trải nghiệm của chúng tôi",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
