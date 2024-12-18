import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/ui/screens/home/tabs/categories/app_category.dart';

class CategoriesTab extends StatelessWidget {
  final void Function(Category) onCategoryClick;

  const CategoriesTab({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Pick Your Category of Interest"),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 34, vertical: 30),
            child: GridView.builder(
                itemCount: Category.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        onCategoryClick(Category.categories[index]);
                      },
                      child: AppCategory(category: Category.categories[index]));
                }),
          ),
        ),
      ],
    );
  }
}
