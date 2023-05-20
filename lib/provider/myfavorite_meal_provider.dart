import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixth_app/data/meals_class.dart';

class FavoriteMeal extends StateNotifier<List<Meal>> {
  FavoriteMeal() : super([]);
  bool toggleFavoriteMeal(Meal meal) {
    final isFavorite = state.contains(meal);
    if (isFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final myFavoriteMeal = StateNotifierProvider<FavoriteMeal, List<Meal>>(
  (ref) {
    return FavoriteMeal();
  },
);
