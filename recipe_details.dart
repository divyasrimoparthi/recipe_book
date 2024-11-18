import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String title;
  final String image;
  final String description;

  const RecipeDetailScreen({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool isFavorite = false; // State to track if the recipe is a favorite

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; // Toggle favorite status
              });
              // You can also handle any additional logic here, like saving to a database
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.image,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              // Recipe Title
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Recipe Description
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              // Ingredients Section
              const Text(
                'Ingredients:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '• 4 large egg whites\n'
                    '• 1 cup granulated sugar\n'
                    '• 1 tsp vanilla extract\n'
                    '• 1 tsp white vinegar\n'
                    '• 2 tsp cornstarch\n'
                    '• 1 cup heavy cream\n'
                    '• Fresh fruits (e.g., strawberries, kiwi, blueberries)',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              // Instructions Section
              const Text(
                'Instructions:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '1. Preheat the oven to 300°F (150°C). Line a baking tray with parchment paper.\n'
                    '2. In a clean bowl, beat the egg whites until soft peaks form.\n'
                    '3. Gradually add sugar, 1 tablespoon at a time, beating well until stiff peaks form.\n'
                    '4. Gently fold in the vanilla extract, vinegar, and cornstarch.\n'
                    '5. Spoon the meringue onto the prepared tray, shaping it into a circle with a slight indentation in the center.\n'
                    '6. Bake for 60-75 minutes, or until the meringue is dry and crisp on the outside.\n'
                    '7. Let the meringue cool completely in the oven with the door slightly open.\n'
                    '8. Whip the heavy cream until soft peaks form and spread it over the cooled meringue.\n'
                    '9. Top with fresh fruits of your choice and serve immediately!',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}