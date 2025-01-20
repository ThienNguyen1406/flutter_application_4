import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/login_screen.dart';
import 'package:flutter_application_4/screen/end_screen.dart';
import 'package:flutter_application_4/themes/app_images.dart';
import 'package:flutter_application_4/widget/bassic_text_input.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  int selectedIndex = -1; // Biến để theo dõi lựa chọn của người dùng

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage(AppImages.logoUC),
                  height: 100,
                  width: 100,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(Icons.arrow_back)),
                      color: Colors.greenAccent,
                      hoverColor: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EndScreen(),
                          ),
                        );
                      },
                      icon: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(Icons.arrow_forward)),
                      color: Colors.greenAccent,
                      hoverColor: Colors.white,
                    ),
                  ],
                )
              ],
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                    "Đánh giá mức độ hài lòng của về dịch vụ của chúng tôi")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildRatingItem(0, "Rất tệ", AppImages.icon1, Colors.red),
                _buildRatingItem(1, "Tệ", AppImages.icon2, Colors.orange),
                _buildRatingItem(
                    2, "Bình thường", AppImages.icon3, Colors.blueGrey),
                _buildRatingItem(3, "Tốt", AppImages.icon4, Colors.blue),
                _buildRatingItem(4, "Rất tốt", AppImages.icon5, Colors.green),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                _buildCommentField("Comment 1"),
                SizedBox(
                  height: 10,
                ),
                _buildCommentField("Comment 2"),
                SizedBox(
                  height: 10,
                ),
                _buildCommentField("Comment 3"),
                SizedBox(
                  height: 10,
                ),
                _buildCommentField("Comment 4"),
                SizedBox(
                  height: 10,
                ),
                _buildCommentField("Ý kiến khác"),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRatingItem(int index, String label, String image, Color color) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index; // Cập nhật lựa chọn
        });
      },
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
            height: 50,
            width: 50,
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: selectedIndex == index
                  ? color
                  : Colors.grey, // Thay đổi màu khi chọn
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCommentField(String hintText) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
