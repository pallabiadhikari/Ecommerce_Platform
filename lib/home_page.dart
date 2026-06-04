import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final VoidCallback onThemeChange;

  const HomePage({
    super.key,
    required this.onThemeChange,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Shop"),

        actions: [
          IconButton(
            onPressed: widget.onThemeChange,
            icon: const Icon(Icons.color_lens),
          )
        ],
      ),

      body: GridView.count(
        crossAxisCount: 2,

        children: const [

          ProductCard(
            name: "Watch",
            price: "\$50",
            icon: Icons.watch,
          ),

          ProductCard(
            name: "Phone",
            price: "\$400",
            icon: Icons.phone_android,
          ),

          ProductCard(
            name: "Headphone",
            price: "\$80",
            icon: Icons.headphones,
          ),

          ProductCard(
            name: "Laptop",
            price: "\$800",
            icon: Icons.laptop,
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
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

class ProductCard extends StatelessWidget {

  final String name;
  final String price;
  final IconData icon;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      margin: const EdgeInsets.all(10),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            size: 60,
          ),

          const SizedBox(height: 10),

          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(price),
        ],
      ),
    );
  }
}