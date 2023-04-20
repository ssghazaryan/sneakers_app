import 'package:flutter/material.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.img,
    required this.brand,
    required this.name,
    required this.price,
    required this.description,
    required this.sizes,
    required this.color,
  });

  final String id;
  final String img;
  final String brand;
  final String name;
  final int price;
  final String description;
  final List<int> sizes;
  final Color color;
}
