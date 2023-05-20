import 'package:flutter/material.dart';

class ItemTrait extends StatelessWidget {
  const ItemTrait({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
