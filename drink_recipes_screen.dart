import 'package:flutter/material.dart';

class DrinkRecipesScreen extends StatelessWidget {
  final List<Map<String, String>> recipes = [
    {'image': 'assets/images/drink_recipe1.png', 'title': 'Aperol Spritz'},
    {'image': 'assets/images/drink_recipe2.png', 'title': 'Bellini'},
    {'image': 'assets/images/drink_recipe3.png', 'title': 'Seltz Limone e Sale'},
    {'image': 'assets/images/drink_recipe4.png', 'title': 'Contratto Spritz'},
    {'image': 'assets/images/drink_recipe5.png', 'title': 'Chelada'},
    {'image': 'assets/images/drink_recipe6.png','title':'Agua Fresca'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Drink Recipes'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return RecipeTile(
              image: recipe['image']!,
              title: recipe['title']!,
            );
          },
        ),
      ),
    );
  }
}

// Reusable Recipe Tile Widget
class RecipeTile extends StatelessWidget {
  final String image;
  final String title;

  const RecipeTile({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}