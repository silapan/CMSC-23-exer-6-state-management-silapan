import 'package:flutter/material.dart';
import 'package:flutter_checkout/model/item.dart';
import 'package:flutter_checkout/provider/shoppingcart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getItems(context),
          computePrice(),
          const Divider(height: 4, color: Colors.black),
          Flexible(
            child: Consumer<ShoppingCart>(
              builder: (context, cart, _) {
                // Condition to check if the cart is not empty
                return cart.cart.isNotEmpty
                    ? Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Removes the content of the cart
                            context.read<ShoppingCart>().removeAll();
                            // Goes to catalog.dart
                            Navigator.pushNamed(context, "/");
                            // Displays "Payment is Successful"
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Payment Successful"),
                              duration: Duration(seconds: 1, milliseconds: 100),
                            ));
                          },
                          child: Text("Pay Now"),
                        ),
                      )
                    : SizedBox(); // Don't display pay button when cart is empty
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget computePrice() {
    return Consumer<ShoppingCart>(
      builder: (context, value, child) {
        return Text('Total Price: ${value.cartTotal}');
      },
    );
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    return products.isEmpty
        ? Text('No Items yet!')
        : Expanded(
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(Icons.food_bank),
                        title: Text(products[index].name),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
