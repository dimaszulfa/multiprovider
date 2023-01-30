import 'dart:developer';

import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Multi Provider")),
        body: GridView.builder(
          itemCount: 100,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  "Product 1",
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
