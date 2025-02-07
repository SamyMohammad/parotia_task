import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Where do you want to go?",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.orange),
          suffixIcon: Icon(Icons.tune, color: Colors.purple),
        ),
      ),
    );
  }
}
