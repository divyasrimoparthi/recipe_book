import 'package:flutter/material.dart';
import 'mexican_recipes_screen.dart'; // Import the MexicanRecipesScreen
import 'chinese_recipes_screen.dart';
import 'italian_recipes_screen.dart';
import 'thai_recipes_screen.dart';
import 'dessert_recipes_screen.dart';
import 'drink_recipes_screen.dart';

void main() {
  runApp(RecipeBookApp());
}

class RecipeBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/mexicanRecipes': (context) => MexicanRecipesScreen(),
        '/chineseRecipes': (context) => ChineseRecipesScreen(),
        '/italianRecipes': (context) => ItalianRecipesScreen(),
        '/thaiRecipes': (context) => ThaiRecipesScreen(),
        '/dessertRecipes': (context) => DessertRecipesScreen(),
        '/drinkRecipes': (context) => DrinkRecipesScreen(),
        '/favorites': (context) => FavoritesScreen(), // Route for favorites
      },
    );
  }
}

// Home Screen with Categories
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Welcome to CookStudio",
          style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/chineseRecipes');
              },
              child: CategoryTile(
                image: 'assets/images/chinese.png',
                title: 'Chinese',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/italianRecipes');
              },
              child: CategoryTile(
                image: 'assets/images/italian.png',
                title: 'Italian',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/mexicanRecipes');
              },
              child: CategoryTile(
                image: 'assets/images/mexican.png',
                title: 'Mexican',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/thaiRecipes');
              },
              child: CategoryTile(
                image: 'assets/images/thai.png',
                title: 'Thai',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/dessertRecipes');
              },
              child: CategoryTile(
                image: 'assets/images/dessert.png',
                title: 'Dessert',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/drinkRecipes');
              },
              child: CategoryTile(
                image: 'assets/images/drink.png',
                title: 'Drink',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        selectedItemColor: Colors.orange,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/favorites'); // Navigate to favorites screen
          }
        },
      ),
    );
  }
}

// Favorites Screen
class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Favorites'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 20), // Space between image and text
            const Text(
              'Sorry! No favorites found :(',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Category Tile Widget
class CategoryTile extends StatelessWidget {
  final String image;
  final String title;

  const CategoryTile({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Recipe Detail Screen with Description Text
class RecipeDetailScreen extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const RecipeDetailScreen({
    required this.title,
    required this.image,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              'This is where you can put the recipe description or details about the recipe. It could include cooking instructions, ingredient lists, or any additional notes.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}