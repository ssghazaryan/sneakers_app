import 'package:flutter/material.dart';
import 'package:sneakers_test_app/pages/home/data/home_data.dart';
import 'package:sneakers_test_app/pages/home/data/home_mocks.dart';

class HomeScreenProvider extends ChangeNotifier {
  /// ----
  HomeData data = HomeData();

  init() {
    data.productsItems.addAll(HomeMocks.products);
  }
}
