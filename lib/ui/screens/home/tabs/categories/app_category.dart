import 'package:flutter/material.dart';

import '../../../../../model/category.dart';

class AppCategory extends StatelessWidget {
  final Category category;
  final radius= const Radius.circular(24);
  const AppCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8 , vertical: 4),
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: category.isLeftSided?Radius.zero :radius,
          bottomRight: !category.isLeftSided?Radius.zero:radius
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(category.imagePath , height: MediaQuery.of(context).size.height*0.15),
          Text(category.title , style: const TextStyle(color: Colors.white),)
        ],
      ),
    ) ;
  }
}
