import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_test_app/globals/import.dart';
import 'package:sneakers_test_app/pages/home/data/home_mocks.dart';
import 'package:sneakers_test_app/pages/home/view/widgets/product_item.dart';

import '../../logic/filter_provider.dart';

class PageViewHolder extends ChangeNotifier {
  double page;

  PageViewHolder({required this.page});

  void setPage(double v) {
    page = v;
    notifyListeners();
  }
}

class ProductsPageView extends StatefulWidget {
  const ProductsPageView({super.key});

  @override
  State<ProductsPageView> createState() => _ProductsPageViewState();
}

class _ProductsPageViewState extends State<ProductsPageView> {
  late final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.7,
  );

  final PageViewHolder _holder = PageViewHolder(page: 0);

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      _holder.setPage(_pageController.page?.toDouble() ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    String selectedId = context.select<HomeScreenFilterProvider, String>(
      (value) => value.producyType,
    );
    return Stack(
      children: [
        ChangeNotifierProvider<PageViewHolder>.value(
          value: _holder,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {
              return HomeItem(
                index: index.toDouble(),
                data: HomeMocks.products.elementAt(index % HomeMocks.products.length),
              );
            },
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              for (var element in HomeMocks.productType.entries)
                Builder(builder: (context) {
                  bool isSelected = element.key == selectedId;

                  return Expanded(
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Provider.of<HomeScreenFilterProvider>(context, listen: false)
                            .updateProducyType(element.key);
                      },
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          element.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isSelected ? Colors.black : AppColors.greyTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            ],
          ),
        ),
      ],
    );
  }
}
