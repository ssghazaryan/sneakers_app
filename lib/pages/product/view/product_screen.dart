import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sneakers_test_app/pages/home/data/models/product_model.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel item;
  const ProductScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Hero(
                tag: item.id,
                child: CustomPaint(
                  painter: DemoPainter(
                    item.color,
                  ),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Row(
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
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    item.brand,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(8),
                                    backgroundColor: item.color.withOpacity(0.8),
                                    elevation: 10,
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Transform.rotate(
                                angle: 0.1,
                                child: Image.asset(
                                  'assets/images/${item.img}',
                                  fit: BoxFit.contain,
                                  width: MediaQuery.of(context).size.width - 130,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              height: 60,
                              color: Colors.grey.withOpacity(
                                0.1,
                              ),
                              child: Transform.translate(
                                offset: Offset(0, 0),
                                child: Image.asset(
                                  'assets/images/${item.img}',
                                  fit: BoxFit.contain,
                                  width: MediaQuery.of(context).size.width - 130,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DemoPainter extends CustomPainter {
  final Color color;
  DemoPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = color;
    final Path path = Path();
    path.lineTo(0.0, size.height / 2);

    var firstEndPoint = Offset(size.width * .65, size.height - 30.0);
    var firstControlpoint = Offset(size.width * 0.25, size.height - 40.0);
    path.quadraticBezierTo(
        firstControlpoint.dx, firstControlpoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 70.0);
    var secondControlPoint = Offset(size.width * .90, size.height - 30);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
