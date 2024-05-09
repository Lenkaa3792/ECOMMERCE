// Importing the material package which contains the necessary widgets and APIs for building material design apps
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'package:sqlite3/common.dart';
//import 'package:sqlite3/wasm.dart';

// The main function, entry point of the application
void main() {
  // Running the app by passing the instance of MyApp widget
  runApp(const MyApp());
}

// MyApp class, a StatelessWidget that represents the root of the application
class MyApp extends StatelessWidget {
  // Constructor for MyApp
  const MyApp();

  // The build method required to override for StatelessWidget, it returns the root widget of the application
  @override
  Widget build(BuildContext context) {
    // MaterialApp widget, provides the core functionality of a material design app
    return MaterialApp(
      // Title of the application
      title: 'Shopeasy',
      // Theme data for the application, specifying the primary swatch color
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      // Setting debugShowCheckedModeBanner to false removes the debug banner in the app
      debugShowCheckedModeBanner: false,
      // The home page of the application, an instance of MyHomePage widget
      home: const MyHomePage(title: 'Shopeasy Home'),
    );
  }
}

// MyHomePage class, a StatelessWidget representing the home page of the application
class MyHomePage extends StatelessWidget {
  // Title of the home page
  final String title;

  // Constructor for MyHomePage
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // The build method required to override for StatelessWidget, it returns the widget hierarchy of the home page
  @override
  Widget build(BuildContext context) {
    // Dummy list of categories
    List<String> categories = [
      'Electronics',
      'Clothing',
      'Shoes',
      'Books',
      'Home & Kitchen',
      'Toys',
      
    ];

    // Scaffold widget, provides a framework for implementing the basic material design visual layout structure of the home page
    return Scaffold(
      // AppBar widget, represents the app bar at the top of the screen
      appBar: AppBar(
        // Title of the app bar, centered using the Center widget
        title: Center(child: Text(title)),
      ),
      // GridView.builder widget, builds a grid view with a custom builder
      body: GridView.builder(
        // SliverGridDelegate that defines the grid layout
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
          childAspectRatio: 2.0, // Aspect ratio of each tile (width / height)
        ),
        // Number of items in the grid view
        itemCount: categories.length,
        // Builder function that returns the widget for each item in the grid view
        itemBuilder: (BuildContext context, int index) {
          // GestureDetector widget, detects gestures on its child and calls onTap callback when tapped
          return GestureDetector(
            // onTap callback function called when the category tile is tapped
            onTap: () {
              // Handle category tap by printing the tapped category
              print('Category tapped: ${categories[index]}');
              // Navigate to categories screen with selected category
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(category: categories[index]),
                ),
              );
            },
            // Card widget, represents a material design card containing the category name
            child: Card(
              elevation: 3.0,
              // Centering the category name text within the card
              child: Center(
                // Text widget displaying the category name
                child: Text(
                  categories[index],
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// CategoriesScreen class, a StatelessWidget representing the screen displaying products for a specific category
class CategoriesScreen extends StatelessWidget {
  // Category for which the products are displayed
  final String category;

  // Constructor for CategoriesScreen
  const CategoriesScreen({Key? key, required this.category}) : super(key: key);

  // The build method required to override for StatelessWidget, it returns the widget hierarchy of the categories screen
  @override
  Widget build(BuildContext context) {
    // Dummy list of products for the selected category
    List<String> products = [
      'screens',
      'laptops',
      'phones',
      'softwares',
      'real estates',
      'cars',
      'lawyers',
      'chefs',
      'music',
      'learning',
    ];

    // Scaffold widget, provides a framework for implementing the basic material design visual layout structure of the categories screen
    return Scaffold(
      // AppBar widget, represents the app bar at the top of the screen
      appBar: AppBar(
        // Title of the app bar, centered using the Center widget
        title: Text(category),
        centerTitle: true,
      ),
      // GridView.builder widget, builds a grid view with a custom builder
      body: GridView.builder(
        // SliverGridDelegate that defines the grid layout
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
          childAspectRatio: 1.5, // Aspect ratio of each tile (width / height)
        ),
        // Number of items in the grid view
        itemCount: products.length,
        // Builder function that returns the widget for each item in the grid view
        itemBuilder: (BuildContext context, int index) {


          //define a list of image file paths corresponding to products
          List<String> imagePaths = [
            'assets/images/screens.jpg',
            'assets/images/laptops.jpg',
            'assets/images/phones.jpg',
            'assets/images/softwares.jpg',
            'assets/images/real estates.jpg',
            'assets/images/cars.jpg',
            'assets/images/lawyers.jpg',
            'assets/images/chefs.jpg',
            'assets/images/music.jpg',
            'assets/images/learning.jpg',
          ];

          // GestureDetector widget, detects gestures on its child and calls onTap callback when tapped
          return GestureDetector(
            // onTap callback function called when the product tile is tapped
            onTap: () {
              // Handle product tap by printing the tapped product and its corresponding image path
              print('Product tapped: ${products[index]}');
              print('Image path: ${imagePaths[index]}');
            },
            // Card widget, represents a material design card containing the product name and image
            child: Card(
              elevation: 3.0,
              //column widget to arrange product name and image vertically
              child: Column(
                children: [
                  // Image widget to display the product image from the local folder
                  Image.asset(
                    imagePaths[index], // Get the image path based on the index
                    fit: BoxFit.cover,
                    height: 150.0,
                    width: 100.0,
                  ),
                  // Padding around the product name text within the card
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    // Text widget displaying the product name
                    child: Text(
                      products[index],
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              
            ),
          );
        },
      ),
    );
    
  }
}
