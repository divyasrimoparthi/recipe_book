import 'package:flutter/material.dart';

class ItalianRecipesScreen extends StatelessWidget {
  final List<Map<String, String>> recipes = [
    {
      'image': 'assets/images/italian_recipe1.png',
      'title': 'Chocolate Cannoli',
    },
    {
      'image': 'assets/images/italian_recipe2.png',
      'title': 'Mom\'s Italian Bread',
    },
    {
      'image': 'assets/images/italian_recipe3.png',
      'title': 'Basil and Parsley Pesto',
    },
    {
      'image': 'assets/images/italian_recipe4.png',
      'title': 'Authentic Pasta Carbonara',
    },
    {
      'image': 'assets/images/italian_recipe5.png',
      'title': 'Risotto Balls (Arancini)',
    },
    {
      'image': 'assets/images/italian_recipe6.png',
      'title': 'Traditional Lasagna',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Chinese Recipes'),
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
            return RecipeTile(
              image: recipes[index]['image']!,
              title: recipes[index]['title']!,
            );
          },
        ),
      ),
    );
  }
}

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
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}