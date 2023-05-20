import 'package:flutter/material.dart';
import 'package:sixth_app/data/dummy_data.dart';
import 'package:sixth_app/data/meals_class.dart';

import 'package:sixth_app/screens/meals_screen.dart';
import 'package:sixth_app/widgets/category_Container.dart';

import '../data/category_class.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    required this.availableMeal,
  });

  final List<Meal> availableMeal;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void navigateToMealsScreen(BuildContext context, Category category) {
    final filteredCategory = widget.availableMeal
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        meals: filteredCategory,
        title: category.title,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            for (final category in availableCategories)
              CategoryContainer(
                category: category,
                navigateToMealScreen: () {
                  navigateToMealsScreen(context, category);
                },
              ),
          ],
        ),
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0.7, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
    );
  }
}
