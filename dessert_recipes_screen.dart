import 'package:flutter/material.dart';
import 'recipe_details.dart'; // Importing the RecipeDetailScreen

class DessertRecipesScreen extends StatelessWidget {
  // List of Dessert Recipes with Title, Image, and Description
  final List<Map<String, dynamic>> recipes = [
    {
      'image': 'assets/images/dessert_recipe1.png',
      'title': 'Pavlova',
      'description': 'A delicate meringue dessert topped with cream and fruits.',
    },
    {
      'image': 'assets/images/dessert_recipe2.png',
      'title': 'Chocolate Mousse',
      'description': 'A rich, creamy chocolate dessert.',
    },
    {
      'image': 'assets/images/dessert_recipe3.png',
      'title': 'Gulab Jamun',
      'description': 'Sweet milk solids soaked in sugar syrup.',
    },
    {
      'image': 'assets/images/dessert_recipe4.png',
      'title': 'Milk Pudding',
      'description': 'A smooth pudding made with milk and vanilla essence.',
    },
    {
      'image': 'assets/images/dessert_recipe5.png',
      'title': 'Vanilla Bean Panna Cotta',
      'description': 'A creamy Italian dessert infused with vanilla.',
    },
    {
      'image': 'assets/images/dessert_recipe6.png',
      'title': 'Concord Grape Granita',
      'description': 'A refreshing grape-flavored ice dessert.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Dessert Recipes'),
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
            crossAxisCount: 2, // Two columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return GestureDetector(
              onTap: () {
                // Navigate to RecipeDetailScreen when a tile is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailScreen(
                      title: recipe['title']!,
                      image: recipe['image']!,
                      description: recipe['description']!,
                    ),
                  ),
                );
              },
              child: RecipeTile(
                image: recipe['image']!,
                title: recipe['title']!,
              ),
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