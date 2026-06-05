import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, String>> cartItems;

  const CartScreen({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Cart is Empty",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    cartItems[index]["image"]!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(cartItems[index]["name"]!),
                  subtitle: Text(cartItems[index]["price"]!),
                );
              },
            ),
    );
  }
}