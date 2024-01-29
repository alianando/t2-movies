import 'package:flutter/material.dart';

class FetchMoreMoviesProvider extends ChangeNotifier {
  String status = 'fetch more movies';
  int target_page_number = 0;

  void changeStatus(String massage) {
    status = massage;
    notifyListeners();
  }

  void update_target_page_number(bool perform_refresh) {
    target_page_number = target_page_number + 1;
    if (perform_refresh) {
      notifyListeners();
    }
  }
}
