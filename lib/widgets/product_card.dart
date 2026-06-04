import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                Text(price),

                const SizedBox(height: 8),

                ElevatedButton(
                  onPressed: onAddToCart,
                  child: const Text("Add to Cart"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}