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
          const SizedBox(height: 10),

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

          const SizedBox(height: 10),

          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
              children: const [
                ProductCard(
                  name: "Gold Ring",
                  price: "\$50",
                  icon: Icons.diamond,
                ),
                ProductCard(
                  name: "Pearl Necklace",
                  price: "\$80",
                  icon: Icons.star,
                ),
                ProductCard(
                  name: "Silver Bracelet",
                  price: "\$35",
                  icon: Icons.favorite,
                ),
                ProductCard(
                  name: "Diamond Earrings",
                  price: "\$120",
                  icon: Icons.circle,
                ),
                ProductCard(
                  name: "Luxury Watch",
                  price: "\$200",
                  icon: Icons.watch,
                ),
                ProductCard(
                  name: "Wedding Ring",
                  price: "\$150",
                  icon: Icons.diamond_outlined,
                ),
              ],
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
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
            ),

            const SizedBox(height: 10),

            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              price,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}