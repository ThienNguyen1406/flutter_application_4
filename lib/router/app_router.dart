import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/login_screen.dart';
import 'package:flutter_application_4/screen/action_sceen.dart';
import 'package:flutter_application_4/screen/bill_screen.dart';
import 'package:flutter_application_4/screen/input_bill_screen.dart';
import 'package:flutter_application_4/screen/vote_screen.dart';

class AppRouter {
  
  static const String loginScreen = '/loginScreen';
  static const String inputBillScreen = '/inputBillScreen';
  static const String billScreen = '/billScreen';
  static const String actionScreen = '/actionScreen';
  static const String voteScreen = '/voteScreen';

  static final routes = <String, WidgetBuilder>{
    loginScreen: (BuildContext context) => const LoginScreen(),
    inputBillScreen: (BuildContext context) => const InputBillScreen(),
    billScreen : (BuildContext context) => const BillScreen(),
    actionScreen:(BuildContext context) => const ActionSceen(),
    voteScreen :(BuildContext context) => const VoteScreen(),
  };
}