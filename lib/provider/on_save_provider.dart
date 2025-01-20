import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/bill_model.dart';

class OnSaveProvider extends ChangeNotifier {
  BillModel _billData = BillModel();
  BillModel get billData => _billData;
  void saveUser(BillModel value) {
    _billData = value;
    notifyListeners();
  }
}
