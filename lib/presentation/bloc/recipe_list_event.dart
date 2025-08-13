part of 'recipe_list_bloc.dart';

@immutable
abstract class RecipeListEvent {}

class LoadInitialRecipesEvent extends RecipeListEvent {}

class LoadMoreRecipesEvent extends RecipeListEvent {}

class ApplyFiltersEvent extends RecipeListEvent {
  final String searchQuery;
  final bool withImageOnly;
  final int? maxPrepTime;
  final bool isTimeFilterApplied;

  ApplyFiltersEvent({
    required this.searchQuery,
    required this.withImageOnly,
    this.maxPrepTime,
    required this.isTimeFilterApplied,
  });
}

class RefreshRecipesEvent extends RecipeListEvent {}

class ToggleFiltersVisibilityEvent extends RecipeListEvent {
  final bool isVisible;

  ToggleFiltersVisibilityEvent(this.isVisible);

}

