import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../globals/import.dart';

class HeaderForHomeScreen extends StatelessWidget {
  const HeaderForHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Discover',
              style: AppStyles.headerTile,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.greyLightColor,
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.greyLightColor,
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
