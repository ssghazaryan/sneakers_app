import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_test_app/logic/home_provider.dart';
import 'package:sneakers_test_app/pages/home/view/widgets/boottom_nav_bar.dart';
import 'package:sneakers_test_app/pages/home/view/widgets/header.dart';

import '../../../logic/filter_provider.dart';
import 'components/horizontal_filter.dart';
import 'components/more_row_items.dart';
import 'components/products_cards_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => HomeScreenProvider()..init(),
          ),
          ChangeNotifierProvider(
            create: (_) => HomeScreenFilterProvider()..init(),
          ),
        ],
        child: Scaffold(
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: mq.size.height / 5.5,
                    width: mq.size.width,
                    color: const Color(0xffF0F1F6),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    const HeaderForHomeScreen(),
                    const SizedBox(height: 20),
                    const HorizontalBrandsFilterForHomeScreen(),
                    const SizedBox(height: 10),
                    const Expanded(
                      flex: 3,
                      child: ProductsPageView(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'More',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: const Icon(
                              Icons.arrow_right_alt,
                              size: 30,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: MoreRowItems(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const BottomNavBar(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
