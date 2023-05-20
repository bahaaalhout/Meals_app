import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixth_app/provider/filter_provider.dart';
import 'package:sixth_app/provider/myfavorite_meal_provider.dart';
import 'package:sixth_app/screens/categories_screen.dart';
import 'package:sixth_app/screens/filter_screen.dart';
import 'package:sixth_app/screens/meals_screen.dart';
import 'package:sixth_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _categoriesButton(String meow) async {
    Navigator.of(context).pop();
    if (meow == 'filter') {
      await Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const FilterScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filterMealProvider);

    String activeTitle = 'Categories';
    Widget activeScreen = CategoryScreen(
      availableMeal: availableMeals,
    );
    if (_selectedPageIndex == 1) {
      final isFavoriteMeal = ref.watch(myFavoriteMeal);
      activeScreen = MealsScreen(
        meals: isFavoriteMeal,
      );
      activeTitle = 'Your favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      drawer: MainDrawer(
        categoryButton: _categoriesButton,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
