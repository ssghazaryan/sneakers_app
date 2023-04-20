import 'package:flutter/material.dart';
import 'package:sneakers_test_app/pages/home/data/home_mocks.dart';

class HomeScreenFilterProvider extends ChangeNotifier {
  /// ----
  late String brandId;
  late String producyType;

  init() {
    brandId = HomeMocks.brands.keys.first;
    producyType = HomeMocks.productType.keys.first;
  }

  updateBrand(String id) {
    brandId = id;
    notifyListeners();
  }

  updateProducyType(String id) {
    producyType = id;
    notifyListeners();
  }
}
