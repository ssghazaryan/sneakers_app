import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_test_app/models/product_model.dart';
import 'package:sneakers_test_app/pages/home/view/components/products_cards_view.dart';

import '../../../../animation/rotation.dart';
import '../../../../animation/shake_animation.dart';
import '../../../../components/bouncing_button.dart';
import '../../../product_detail/view/product_screen.dart';

class HomeItem extends StatelessWidget {
  final double index;
  final ProductModel data;
  const HomeItem({
    super.key,
    required this.index,
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    double page = Provider.of<PageViewHolder>(context).page;
    double diff = index - page;
    double scaleValue = 1 + diff.abs() * 0.1;

    double gauss = exp(-(pow((diff.abs() - 0.5), 2) / 0.08));

    bool isPrevious = page > index;

    return ShakeAnimatedWidget(
      enabled: (gauss / 4) * 4 > 1,
      shakeAngle: Rotation.deg(y: 40),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 3, scaleValue)
          ..rotateY((gauss / 4) * 4),
        alignment: FractionalOffset.center,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: isPrevious ? 0 : 1,
          child: Hero(
            tag: data.id,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Card(
                    elevation: 8,
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: data.color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.brand.toUpperCase(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          data.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '\$${data.price}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_right_alt,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..rotateZ(
                      isPrevious ? 0 : (-(gauss / 4)),
                    ),
                  alignment: FractionalOffset.centerRight,
                  child: BouncingButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (_) => ProductScreen(
                            item: data,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/${data.img}',
                        width: 200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
