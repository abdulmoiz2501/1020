import 'package:flutter/material.dart';

class SearchLoadingShimmer extends StatelessWidget {
  const SearchLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
