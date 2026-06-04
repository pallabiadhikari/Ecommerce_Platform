import 'package:flutter/material.dart';

void main() {
  runApp(const InfiniaStore());
}

class InfiniaStore extends StatelessWidget {
  const InfiniaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Infinia Store',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      "name": "Elegant Necklace",
      "price": "\$120",
      "image": "https://images.unsplash.com/photo-1617038260897-41a1f14a8ca0",
    },
    {
      "name": "Luxury Ring",
      "price": "\$90",
      "image": "https://images.unsplash.com/photo-1605100804763-247f67b3557e",
    },
    {
      "name": "Gold Bracelet",
      "price": "\$75",
      "image": "https://images.unsplash.com/photo-1515562141207-7a88fb7ce338",
    },
    {
      "name": "Silver Earrings",
      "price": "\$60",
      "image": "https://images.unsplash.com/photo-1535632066927-ab7c9ab60908",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          "Infinia Store",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.pink,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search accessories...",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Banner
            Container(
              margin: const EdgeInsets.all(16),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CategoryItem(icon: Icons.diamond, title: "Necklace"),
                  CategoryItem(icon: Icons.ring_volume, title: "Rings"),
                  CategoryItem(icon: Icons.watch, title: "Watches"),
                  CategoryItem(icon: Icons.star, title: "Luxury"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Product Grid
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductCard(
                    name: product["name"],
                    price: product["price"],
                    image: product["image"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.pink.shade100,
          child: Icon(icon, color: Colors.pink),
        ),
        const SizedBox(height: 8),
        Text(title),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.pink,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
