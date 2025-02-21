import 'package:flutter/material.dart';
import 'package:flutter_application_4/screen/vote_screen.dart';
import 'package:flutter_application_4/themes/app_images.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_4/provider/image_provider.dart';

class ActionSceen extends StatefulWidget {
  const ActionSceen({super.key});

  @override
  State<ActionSceen> createState() => _ActionSceenState();
}

class _ActionSceenState extends State<ActionSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ImagesProvider>(
        builder: (context, imagesProvider, child) {
          return Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(seconds: 2),
                key: ValueKey<int>(imagesProvider.currentIndex),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  key: ValueKey<int>(imagesProvider.currentIndex),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imagesProvider.currentImage.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Image.asset(
                      AppImages.logoUC,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  Center(
                    child: Text(
                      "Chia sẻ trải nghiệm của quý khách tại Nha khoa Quốc tế Úc Châu",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VoteScreen(),
                        ),
                      );
                    },
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16),
                            width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(47, 179, 178, 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Text(
                          "Bắt đầu",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
