part of 'recipe_list_bloc.dart';

@immutable
abstract class RecipeListState {}

class RecipeListInitial extends RecipeListState {}

class RecipeListLoading extends RecipeListState {}

class RecipeListLoaded extends RecipeListState {
  final List<Recipe> recipes;
  final List<Recipe> filteredRecipes;
  final int offset;
  final bool hasMore;
  final bool showFilters;
  final String? errorMessage;
  final bool isLoadingMore; 
  
  final String searchQuery;
  final bool withImageOnly;
  final int? maxPrepTime;
  final bool isTimeFilterApplied;

  RecipeListLoaded({
    required this.recipes,
    required this.filteredRecipes,
    required this.offset,
    required this.hasMore,
    this.showFilters = false,
    this.errorMessage,
    this.isLoadingMore = false, 
    this.searchQuery = '',
    this.withImageOnly = false,
    this.maxPrepTime,
    this.isTimeFilterApplied = false,
  });

  RecipeListLoaded copyWith({
    List<Recipe>? recipes,
    List<Recipe>? filteredRecipes,
    int? offset,
    bool? hasMore,
    bool? showFilters,
    String? errorMessage,
    bool? isLoadingMore, 
    String? searchQuery,
    bool? withImageOnly,
    int? maxPrepTime,
    bool? isTimeFilterApplied,
  }) {
    return RecipeListLoaded(
      recipes: recipes ?? this.recipes,
      filteredRecipes: filteredRecipes ?? this.filteredRecipes,
      offset: offset ?? this.offset,
      hasMore: hasMore ?? this.hasMore,
      showFilters: showFilters ?? this.showFilters,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore, 
      searchQuery: searchQuery ?? this.searchQuery,
      withImageOnly: withImageOnly ?? this.withImageOnly,
      maxPrepTime: maxPrepTime ?? this.maxPrepTime,
      isTimeFilterApplied: isTimeFilterApplied ?? this.isTimeFilterApplied,
    );
  }
}

class RecipeListError extends RecipeListState {
  final String errorMessage;

  RecipeListError({required this.errorMessage});
}