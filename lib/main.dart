import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multiprovider/models/product.dart';
import 'package:multiprovider/views/detail/detail_product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeApp(),
      routes: {DetailProduct.route: (context) => DetailProduct()},
    );
  }
}

class MyHomeApp extends StatelessWidget {
  final List<Product> dataList = List.generate(
      100,
      (index) => Product(
          name: "product$index",
          title: "title$index",
          price: 1000.0 + index.toDouble(),
          qty: index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Multi Provider")),
        body: GridView.builder(
          itemCount: dataList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return GridTile(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(DetailProduct.route);
                },
                child: Image.asset("image/qt.jpg"),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.redAccent,
                title: Text(
                  (dataList.isNotEmpty)
                      ? dataList[index].title
                      : "Tidak ada data",
                  textAlign: TextAlign.center,
                ),
                leading: IconButton(
                    onPressed: () {
                      log("fav");
                    },
                    icon: Icon(Icons.favorite_border_outlined)),
                trailing: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    log("cart");
                  },
                ),
              ),
            );
          },
        ));
  }
}
