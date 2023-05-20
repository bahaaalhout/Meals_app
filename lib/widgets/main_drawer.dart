import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.categoryButton,
  });
  final void Function(String meow) categoryButton;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: Center(
              child: ListTile(
                leading: const Icon(
                  Icons.flatware,
                  size: 35,
                ),
                iconColor: Theme.of(context).colorScheme.primary,
                title: const Text(
                  'Cooking Up!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              categoryButton('potato');
            },
            leading: const Icon(
              Icons.category,
              size: 25,
            ),
            iconColor: Theme.of(context).colorScheme.primary,
            title: const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Theme.of(context).colorScheme.primary,
          ),
          ListTile(
            onTap: () {
              categoryButton('filter');
            },
            leading: const Icon(
              Icons.settings,
              size: 25,
            ),
            iconColor: Theme.of(context).colorScheme.primary,
            title: const Text(
              'Filter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
