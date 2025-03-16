import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onClear;
  final Function(String)? onChanged;

  const SearchTextField({
    Key? key,
    this.controller,
    this.onClear,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'TV shows, movies and more',
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: InkWell(
            onTap: onClear,
            child: const Icon(Icons.close),
          ),
        ),
      ),
    );
  }
}
