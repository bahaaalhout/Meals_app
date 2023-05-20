import 'package:flutter/material.dart';
import 'package:sixth_app/data/category_class.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key, required this.category, required this.navigateToMealScreen});
  final Category category;
  final void Function() navigateToMealScreen;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigateToMealScreen,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        // margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(.55),
              category.color.withOpacity(.9),
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          category.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
