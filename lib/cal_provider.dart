import 'package:flutter/material.dart';

class CalProvider extends ChangeNotifier {
  int _inputValue = 0;
  bool _inputbool = false;
  double _inputDoubleValue = 0.0;
  double _result = 0.0;

  List<dynamic> _inputList = [];
  List<int> _numbers = [];
  List<String> _operations = [];

  int get inputValue => _inputValue;
  bool get inputbool => _inputbool;
  double get inputDoubleValue => _inputDoubleValue;
  List<dynamic> get inputList => _inputList;
  double get result => _result;
  List<int> get numbers => _numbers;
  List<String> get operations => _operations;

  value(int num) {
    _inputValue = int.parse('$_inputValue$num');
    notifyListeners();
  }

  ac() {
    _inputbool = false;
    _inputValue = 0;
    _inputList = [];
    _result = 0;
    _numbers = [];
    _operations = [];
    notifyListeners();
  }

  postivenegative() {
    _inputbool
        ? _inputDoubleValue >= 0.0
            ? _inputDoubleValue = -_inputDoubleValue
            : _inputDoubleValue = _inputDoubleValue.abs()
        : _inputValue >= 0
            ? _inputValue = -_inputValue
            : _inputValue = _inputValue.abs();
    notifyListeners();
  }

  percentage() {
    _inputbool = true;
    _inputDoubleValue = _inputValue / 100;
    notifyListeners();
  }

  operation(String text) {
    _result = inputValue.toDouble();
    _inputbool ? _inputList.add(_inputDoubleValue) : _inputList.add(inputValue);
    _inputList.add(text);
    _inputValue = 0;
    print(_inputList);

    notifyListeners();
  }
}
