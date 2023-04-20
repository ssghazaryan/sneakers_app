import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_test_app/pages/home/data/home_mocks.dart';
import 'package:sneakers_test_app/globals/colors.dart';
import 'package:sneakers_test_app/pages/home/logic/filter_provider.dart';

Size calcTextSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: TextDirection.ltr,
    textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
  )..layout();
  return textPainter.size;
}

class HorizontalBrandsFilterForHomeScreen extends StatelessWidget {
  const HorizontalBrandsFilterForHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedId = context.select<HomeScreenFilterProvider, String>(
      (value) => value.brandId,
    );
    return SizedBox(
      height: 30,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: HomeMocks.brands.length,
        itemBuilder: (_, index) {
          final item = HomeMocks.brands.entries.elementAt(index);
          bool isSelected = item.key == selectedId;
          TextStyle temp = TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : AppColors.greyTextColor,
          );
          double weight = calcTextSize(item.value, temp).width;
          return CupertinoButton(
            onPressed: () {
              Provider.of<HomeScreenFilterProvider>(context, listen: false).updateBrand(item.key);
            },
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    opacity: isSelected ? 1 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        height: 10,
                        width: weight + 20,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: weight + 20,
                    child: Text(
                      item.value,
                      textAlign: TextAlign.center,
                      style: temp,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
