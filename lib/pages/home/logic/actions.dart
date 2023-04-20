import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_test_app/pages/home/logic/filter_provider.dart';

abstract class HomeScreenActions {
  static void updateBrand(BuildContext context, String brandId) {
    Provider.of<HomeScreenFilterProvider>(context, listen: false).updateBrand(brandId);
  }

  static void updateProducyType(BuildContext context, String brandId) {
    Provider.of<HomeScreenFilterProvider>(context, listen: false).updateProducyType(brandId);
  }
}
