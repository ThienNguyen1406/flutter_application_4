import 'package:flutter/material.dart';

class ImagesProvider extends ChangeNotifier {
  List<Image> listImage = [
    Image.asset("assets/images/anh1.jpg"),
    Image.asset("assets/images/anh2.jpg"),
    Image.asset("assets/images/anh3.JPG"),
    Image.asset("assets/images/anh4.jpg"),
    Image.asset("assets/images/anh5.JPG"),
  ];

  int currentIndex = 0;

  ImagesProvider() {
    _startAutoChange();
  }

  void _startAutoChange() {
    Future.delayed(Duration(seconds: 2), () {
      _updateImage();
      _startAutoChange();
    });
  }

  void _updateImage() {
    currentIndex = (currentIndex + 1) % listImage.length;
    notifyListeners();
  }

  Image get currentImage {
    return listImage[currentIndex];
  }
}
