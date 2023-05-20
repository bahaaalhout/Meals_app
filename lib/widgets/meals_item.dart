import 'package:flutter/material.dart';
import 'package:sixth_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../data/meals_class.dart';
import '../screens/meals_details_screen.dart';

class MealsList extends StatelessWidget {
  const MealsList({
    super.key,
    required this.meals,
  });
  final Meal meals;

  void navigateToMealDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(
          meal: meals,
        ),
      ),
    );
  }

  String get complexityText {
    return meals.complexity.name[0].toUpperCase() +
        meals.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meals.affordability.name[0].toUpperCase() +
        meals.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToMealDetails(context);
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        height: 200,
        child: Stack(
          children: [
            Hero(
              tag: meals.id,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: meals.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Column(
              children: [
                Flexible(flex: 2, child: Container()),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.black.withOpacity(.7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          meals.title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ItemTrait(
                                icon: Icons.schedule,
                                title: '${meals.duration} min'),
                            const SizedBox(width: 10),
                            ItemTrait(
                              icon: Icons.work,
                              title: complexityText,
                            ),
                            const SizedBox(width: 10),
                            ItemTrait(
                              icon: Icons.attach_money,
                              title: affordabilityText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
