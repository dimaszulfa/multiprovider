import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String? name;
  final String? title;
  final double? price;
  final int? qty;

  Product({this.name, this.title, this.price, this.qty});
}
