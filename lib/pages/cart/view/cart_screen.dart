import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../globals/colors.dart';
import '../../../logic/cart_provider.dart';
import '../../../models/cart_item.dart';
import 'components/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCount = context.select<CartScreenProvider, int>(
      (value) => value.totalCount,
    );
    final cartItems = context.select<CartScreenProvider, List<CartItem>>(
      (value) => value.cartItems,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.arrow_right_alt_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'My Bag',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Total $cartCount items',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7)),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: cartItems.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: index == 0 ? 10 : 20),
                    child: CartItemView(
                      item: cartItems.elementAt(index),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Builder(builder: (context) {
                        int total = 0;
                        for (var element in cartItems) {
                          total += element.count * element.productModel.price;
                        }
                        return Text(
                          total == 0 ? '' : '\$$total',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CupertinoButton(
                color: AppColors.selectedColor,
                onPressed: cartCount == 0 ? null : () {},
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Next'.toUpperCase(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
