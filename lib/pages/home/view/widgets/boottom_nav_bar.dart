import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_test_app/globals/colors.dart';
import 'package:sneakers_test_app/logic/cart_provider.dart';
import 'package:sneakers_test_app/pages/cart/view/cart_screen.dart';

Map<String, IconData> tabs = {
  'home': Icons.home_outlined,
  'heart': Icons.favorite_border,
  'home_location': Icons.location_on_outlined,
  'cart': Icons.shopping_cart_outlined,
  'profile': Icons.person_outline,
};

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  Widget getIconButton({
    required BuildContext context,
    required Function onPressed,
    required IconData iconData,
    required bool isSelected,
    required String tabKey,
  }) {
    final cartCount = context.select<CartScreenProvider, int>(
      (value) => value.cartItems.length,
    );
    return Center(
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (tabKey == 'cart') {
            Navigator.push(
              context,
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (_) => const CartScreen(),
              ),
            );
          }
        },
        icon: Stack(
          children: [
            Center(
              child: Icon(
                iconData,
                color: isSelected ? AppColors.selectedColor : AppColors.greyTextColor,
                size: 30,
              ),
            ),
            if (tabKey == 'cart' && cartCount != 0)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 25),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      cartCount.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          for (var item in tabs.entries)
            Expanded(
              child: getIconButton(
                context: context,
                tabKey: item.key,
                iconData: item.value,
                isSelected: item.key == 'home',
                onPressed: () {},
              ),
            ),
        ],
      ),
    );
  }
}
