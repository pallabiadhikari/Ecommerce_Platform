import 'package:flutter/material.dart';
import '../../data/product_data.dart';
import '../../widgets/category_chip.dart';
import '../../models/product.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/product_card.dart';
import '../cart/cart_screen.dart';

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
  String selectedCategory = "All";

  List<Map<String, String>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {

  bool searchMatch = product.name
      .toLowerCase()
      .contains(searchText.toLowerCase());

  bool categoryMatch =
      selectedCategory == "All" ||
      product.category == selectedCategory;

  return searchMatch && categoryMatch;

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

    Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartScreen(
                  cartItems: cartItems,
                ),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart),
        ),

        if (cartItems.isNotEmpty)
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                cartItems.length.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    ),
  ],
),
      body: Column(
        children: [
          SearchBarWidget(
  onChanged: (value) {
    setState(() {
      searchText = value;
    });
  },
),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryChip(
  text: "All",
  isSelected: selectedCategory == "All",
  onTap: () {
    setState(() {
      selectedCategory = "All";
    });
  },
),

CategoryChip(
  text: "Rings",
  isSelected: selectedCategory == "Rings",
  onTap: () {
    setState(() {
      selectedCategory = "Rings";
    });
  },
),

CategoryChip(
  text: "Necklaces",
  isSelected: selectedCategory == "Necklaces",
  onTap: () {
    setState(() {
      selectedCategory = "Necklaces";
    });
  },
),

CategoryChip(
  text: "Bracelets",
  isSelected: selectedCategory == "Bracelets",
  onTap: () {
    setState(() {
      selectedCategory = "Bracelets";
    });
  },
),

CategoryChip(
  text: "Earrings",
  isSelected: selectedCategory == "Earrings",
  onTap: () {
    setState(() {
      selectedCategory = "Earrings";
    });
  },
),

CategoryChip(
  text: "Watches",
  isSelected: selectedCategory == "Watches",
  onTap: () {
    setState(() {
      selectedCategory = "Watches";
    });
  },
),
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