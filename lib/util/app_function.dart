import 'package:flutter/material.dart';
import 'package:flutter_application_4/provider/loading_provider.dart';
import 'package:provider/provider.dart';

class AppFunction {
  static showLoading(BuildContext context) {
    context.read<LoadingProvider>().showLoading();
  }

  static hideLoading(BuildContext context) {
    context.read<LoadingProvider>().hideLoading();
  }
}
