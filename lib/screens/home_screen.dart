import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeChange;

  const HomeScreen({
    super.key,
    required this.onThemeChange,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  String searchText = '';

  List<Map<String, String>> cartItems = [];

  final List<Product> products = [
    Product(
      name: "Gold Ring",
      price: "\$50",
      image: "assets/images/ring.jpg",
    ),
    Product(
      name: "Pearl Necklace",
      price: "\$80",
      image: "assets/images/necklace.jpg",
    ),
    Product(
      name: "Silver Bracelet",
      price: "\$35",
      image: "assets/images/bracelet.jpg",
    ),
    Product(
      name: "Diamond Earrings",
      price: "\$120",
      image: "assets/images/earrings.jpg",
    ),
  ];

  Widget categoryChip(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Chip(
        label: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      return product.name
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Infinia Jewelry",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: widget.onThemeChange,
            icon: const Icon(Icons.color_lens),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search jewelry...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                categoryChip("Rings"),
                categoryChip("Necklaces"),
                categoryChip("Bracelets"),
                categoryChip("Earrings"),
                categoryChip("Watches"),
              ],
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: filteredProducts.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return ProductCard(
                  name: product.name,
                  price: product.price,
                  image: product.image,
                  onAddToCart: () {
                    setState(() {
                      cartItems.add({
                        "name": product.name,
                        "price": product.price,
                        "image": product.image,
                      });
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text("${product.name} added to cart"),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartScreen(
                  cartItems: cartItems,
                ),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}