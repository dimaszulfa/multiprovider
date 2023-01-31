import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String name;
  final String title;
  final double price;
  final int qty;
  bool isFavorite;

  Product(
      {required this.name,
      required this.title,
      required this.price,
      required this.qty,
      this.isFavorite = false});
}
