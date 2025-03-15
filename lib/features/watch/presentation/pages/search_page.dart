
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 6,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Search Result ${index + 1}'),
            subtitle: const Text('Subtitle...'),
          );
        },
      ),
    );
  }
}
