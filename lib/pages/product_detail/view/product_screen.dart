import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sneakers_test_app/models/product_model.dart';
import 'package:sneakers_test_app/pages/product_detail/view/components/product_header_hero.dart';

import 'components/product_description.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel item;
  const ProductScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: ProductHeaderHero(item: item),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              height: 60,
                              color: Colors.grey.withOpacity(
                                0.1,
                              ),
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..rotateZ(
                                    0.4,
                                  ),
                                alignment: FractionalOffset.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/${item.img}',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      height: 20,
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 2,
                    ),
                  ),
                  Expanded(
                    child: ProductDescription(
                      productData: item,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
