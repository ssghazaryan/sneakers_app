import 'package:flutter/material.dart';
import 'package:sneakers_test_app/globals/colors.dart';
import 'package:sneakers_test_app/pages/home/data/home_mocks.dart';

class MoreRowItems extends StatelessWidget {
  const MoreRowItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          for (int i = 0; i < 2; i++)
            Builder(builder: (context) {
              final item = HomeMocks.products.elementAt(i);
              return Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  margin: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          color: AppColors.selectedColor,
                          child: const RotatedBox(
                            quarterTurns: -1,
                            child: Text(
                              'NEW',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                              child: Transform.rotate(
                                angle: 0.25,
                                child: Image.asset(
                                  'assets/images/${item.img}',
                                ),
                              ),
                            ),
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '\$${item.price}',
                              style: const TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }
}
