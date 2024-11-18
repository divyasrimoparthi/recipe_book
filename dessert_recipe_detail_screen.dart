import 'package:flutter/material.dart';

class DessertRecipeDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const DessertRecipeDetailScreen({
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ingredients:\n- 4 egg whites\n- 1 cup sugar\n- 1 tsp vanilla extract\n- 1 cup whipped cream\n- Mixed berries for topping',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Instructions:\n1. Preheat oven to 150°C (300°F).\n2. Beat egg whites until soft peaks form.\n3. Gradually add sugar, beating until stiff peaks form.\n4. Spread mixture on a baking sheet in a circular shape.\n5. Bake for 1 hour. Let cool completely.\n6. Top with whipped cream and fresh berries.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
