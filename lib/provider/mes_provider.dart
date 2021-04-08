import 'package:flutter/cupertino.dart';

class MesService with ChangeNotifier {
  String _selectedMonth;
  bool _isLoading = true;
  bool get isLoading => this._isLoading;

  get selectedMonth => this._selectedMonth;

  set selectedMonth(String value) {
    this._selectedMonth = value;
    this._isLoading = false;
    notifyListeners();
  }
}
