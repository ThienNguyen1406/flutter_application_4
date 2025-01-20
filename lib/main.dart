import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/login_screen.dart';
import 'package:flutter_application_4/provider/image_provider.dart';
import 'package:flutter_application_4/provider/loading_provider.dart';
import 'package:flutter_application_4/provider/on_save_provider.dart';
import 'package:flutter_application_4/widget/loading_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider(create: (_) => OnSaveProvider()),
        ChangeNotifierProvider(create: (_) => ImagesProvider()),
      ],
      builder: (context, _) {
        return Consumer<LoadingProvider>(
          builder: (context, loading, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Stack(
                children: [
                  MaterialApp(
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                      useMaterial3: false,
                    ),
                    debugShowCheckedModeBanner: false,
                    home: LoginScreen(),
                  ),
                  loading.isLoading
                      ? const LoadingWidget()
                      : const SizedBox.shrink()
                ],
              ),
            );
          },
        );
      },
    );
  }
}
