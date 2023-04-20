import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_test_app/globals/import.dart';

import '../../../home/data/models/product_model.dart';
import '../../../home/view/components/horizontal_filter.dart';
import '../../logic/product_detail_provider.dart';

class ProductDescription extends StatelessWidget {
  final ProductModel productData;

  const ProductDescription({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
    );
    return ChangeNotifierProvider(
      create: (_) => ProductDetailsProvider(),
      child: Consumer<ProductDetailsProvider>(
        builder: (context, provider, state) {
          return SafeArea(
            top: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                productData.name,
                                style: style,
                              ),
                            ),
                          ),
                          Builder(builder: (context) {
                            double weight = calcTextSize('\$${productData.price}', style).width;
                            return Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      height: 8,
                                      width: weight + 5,
                                      decoration: const BoxDecoration(
                                        color: Color(0xffF6E9ED),
                                      )),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    width: weight + 5,
                                    child: Text(
                                      '\$${productData.price}',
                                      textAlign: TextAlign.center,
                                      style: style,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        productData.description,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.black.withOpacity(
                            0.6,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                            bottom: 3,
                          ),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0, // Underline thickness
                          ))),
                          child: Text(
                            "More Details".toUpperCase(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Size',
                              style: style,
                            ),
                          ),
                          CupertinoButton(
                            child: Text(
                              'UK',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: provider.ukSize ? Colors.black : AppColors.greyTextColor,
                              ),
                            ),
                            onPressed: () {
                              provider.changeUkSize(true);
                            },
                          ),
                          CupertinoButton(
                            child: Text(
                              'USA',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: !provider.ukSize ? Colors.black : AppColors.greyTextColor,
                              ),
                            ),
                            onPressed: () {
                              provider.changeUkSize(false);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: productData.sizes.length,
                    itemBuilder: (_, index) {
                      final text = productData.sizes[index] + (provider.ukSize ? 0 : 2);
                      bool isChecked = provider.selectedIndex == index;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            if (index == 0)
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 50,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(width: 1, color: AppColors.greyTextColor),
                                ),
                                child: Center(
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Try it',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(Icons.square_foot_rounded)
                                    ],
                                  ),
                                ),
                              ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                provider.setSelectedIndex(
                                    index == provider.selectedIndex ? null : index);
                              },
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                  color: isChecked ? Colors.black : null,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      width: 1,
                                      color: isChecked ? Colors.black : AppColors.greyTextColor),
                                ),
                                child: Center(
                                  child: Text(
                                    text.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: isChecked ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CupertinoButton(
                    color: AppColors.selectedColor,
                    onPressed: provider.selectedIndex != null ? () {} : null,
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Add to Bag'.toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
