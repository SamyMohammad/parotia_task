import 'package:flutter/material.dart';
import 'package:parotia_task/features/visitor/visitor_home/presentation/widgets/category_tab.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryTab(title: "Marine Area", isSelected: true),
          CategoryTab(title: "Wilderness Area"),
          CategoryTab(title: "Desert Area"),
          CategoryTab(title: "Mountainous Area"),
        ],
      ),
    );
  }
}
