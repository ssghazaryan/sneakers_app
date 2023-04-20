import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_test_app/logic/cart_provider.dart';
import 'package:sneakers_test_app/models/cart_item.dart';

class CartItemView extends StatefulWidget {
  final CartItem item;
  const CartItemView({super.key, required this.item});

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 110,
              height: 90,
              decoration: BoxDecoration(
                color: const Color(0xffD4D8DA).withOpacity(0.6),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  'assets/images/${widget.item.productModel.img}',
                  width: 125,
                ),
              ),
            ),
          ],
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${widget.item.productModel.brand} ${widget.item.productModel.name}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    'SIZE: ${widget.item.productModel.sizes[widget.item.size]} UK',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Builder(builder: (context) {
                int total = widget.item.count * widget.item.productModel.price;
                return Text(
                  total == 0 ? '' : '\$$total',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                );
              }),
              Row(
                children: [
                  CupertinoButton(
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    onPressed: () {
                      Provider.of<CartScreenProvider>(context, listen: false)
                          .incrementDecrement(false, widget.item.id);
                    },
                  ),
                  Text(
                    '${widget.item.count}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  CupertinoButton(
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    onPressed: () {
                      Provider.of<CartScreenProvider>(context, listen: false)
                          .incrementDecrement(true, widget.item.id);
                    },
                  )
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
