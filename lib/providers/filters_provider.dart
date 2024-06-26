import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_providers.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state, // will add the map and update one value of the filters
      filter: isActive
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>((ref) {
  return FilterNotifier();
});

final filteredMealsProviders = Provider((ref) {
  final meals=ref.watch(mealsProviders);
  final activefilters=ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activefilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activefilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activefilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
