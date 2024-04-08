import 'package:flutter/material.dart';
import 'package:flutter_checkout/screen/cart.dart';
import 'package:flutter_checkout/screen/catalog.dart';
import 'package:flutter_checkout/screen/checkout.dart';
import 'package:flutter_checkout/provider/shoppingcart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ShoppingCart(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "State Management",
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              color: Colors.blue,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold))),
      initialRoute: "/",
      routes: {
        "/": (context) => CatalogPage(),
        "/cart": (context) => CartScreen(),
        "/checkout": (context) => CheckoutScreen()
      },
    );
  }
}
