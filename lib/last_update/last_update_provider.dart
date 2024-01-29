import 'package:flutter/material.dart';

class LastUpdateProvider extends ChangeNotifier {
  LastUpdateProvider();
  DateTime _last_update_dt = DateTime.now();
  DateTime get last_update_dt => _last_update_dt;
  void update_last_update_time(DateTime new_dt){
    _last_update_dt = new_dt;
    notifyListeners();
  }
}