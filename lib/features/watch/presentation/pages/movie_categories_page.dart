
import 'package:flutter/material.dart';

class MoviesCategoriesPage extends StatelessWidget {
  const MoviesCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.8,
        ),
        itemCount: 6, // e.g., 6 categories
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text('Category ${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
