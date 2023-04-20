import 'package:sneakers_test_app/models/product_model.dart';

class CartItem {
  final String id;
  final ProductModel productModel;
  final int size;
  int count;

  CartItem({
    required this.id,
    required this.productModel,
    required this.size,
    this.count = 1,
  });
}
