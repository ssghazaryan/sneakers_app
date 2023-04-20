import 'package:flutter/material.dart';
import 'package:sneakers_test_app/globals/colors.dart';

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
    required Function onPressed,
    required IconData iconData,
    required bool isSelected,
  }) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        iconData,
        color: isSelected ? AppColors.selectedColor : AppColors.greyTextColor,
        size: 30,
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
