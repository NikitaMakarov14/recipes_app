import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/datasources/api_service.dart';
import '../../data/datasources/hive_service.dart';
import '../../domain/entities/response_entity.dart';

part 'recipe_list_event.dart';
part 'recipe_list_state.dart';

class RecipeListBloc extends Bloc<RecipeListEvent, RecipeListState> {
  final ApiService _apiService;

  RecipeListBloc({required ApiService apiService})
    : _apiService = apiService,
      super(RecipeListInitial()) {
    on<LoadInitialRecipesEvent>(_onLoadInitialRecipes);
    on<LoadMoreRecipesEvent>(_onLoadMoreRecipes);
    on<ApplyFiltersEvent>(_onApplyFilters);
    on<RefreshRecipesEvent>(_onRefreshRecipes);
    on<ToggleFiltersVisibilityEvent>(_onToggleFiltersVisibility);
  }

  Future<void> _onLoadInitialRecipes(
    LoadInitialRecipesEvent event,
    Emitter<RecipeListState> emit,
  ) async {
    emit(RecipeListLoading());

    try {
      final response = await _apiService.getRecipes(offset: 0, limit: 10);
      await HiveService.saveRecipes(response);

      final filteredRecipes = _applyFilters(
        response,
        searchQuery: '',
        withImageOnly: false,
        maxPrepTime: null,
        isTimeFilterApplied: false,
      );

      emit(
        RecipeListLoaded(
          recipes: response,
          filteredRecipes: filteredRecipes,
          offset: response.length,
          hasMore: response.length == 10,
        ),
      );
    } catch (e) {
      try {
        final cachedResponse = await HiveService.getRecipes();
        if (cachedResponse != null) {
          emit(
            RecipeListLoaded(
              recipes: cachedResponse,
              filteredRecipes: cachedResponse,
              offset: cachedResponse.length,
              hasMore: false,
              errorMessage: "Нет подключения к интернету. Показаны кэшированные данные",
            ),
          );
        } else {
          emit(
            RecipeListError(
              errorMessage: "Нет подключения к интернету и данные не найдены в кэше",
            ),
          );
        }
      } catch (e) {
        emit(RecipeListError(errorMessage: "Ошибка загрузки: ${e.toString()}"));
      }
    }
  }

  Future<void> _onLoadMoreRecipes(
    LoadMoreRecipesEvent event,
    Emitter<RecipeListState> emit,
  ) async {
    if (state is! RecipeListLoaded) return;
    final currentState = state as RecipeListLoaded;
    
    if (!currentState.hasMore || currentState.isLoadingMore) return;

    try {
      emit(currentState.copyWith(isLoadingMore: true));
      
      final response = await _apiService.getRecipes(
        offset: currentState.offset,
        limit: 10,
      );

      final newRecipes = [...currentState.recipes, ...response];

      final filteredRecipes = _applyFilters(
        newRecipes,
        searchQuery: currentState.searchQuery,
        withImageOnly: currentState.withImageOnly,
        maxPrepTime: currentState.maxPrepTime,
        isTimeFilterApplied: currentState.isTimeFilterApplied,
      );

      emit(
        currentState.copyWith(
          recipes: newRecipes,
          filteredRecipes: filteredRecipes,
          offset: currentState.offset + response.length,
          hasMore: response.length == 10,
          isLoadingMore: false, 
        ),
      );
    } catch (e) {
      emit(
        currentState.copyWith(
          errorMessage: 'Ошибка при загрузке данных: ${e.toString()}',
          isLoadingMore: false, 
        ),
      );
    }
  }

  void _onApplyFilters(ApplyFiltersEvent event, Emitter<RecipeListState> emit) {
    if (state is! RecipeListLoaded) return;
    final currentState = state as RecipeListLoaded;

    final filteredRecipes = _applyFilters(
      currentState.recipes,
      searchQuery: event.searchQuery,
      withImageOnly: event.withImageOnly,
      maxPrepTime: event.maxPrepTime,
      isTimeFilterApplied: event.isTimeFilterApplied,
    );

    emit(
      currentState.copyWith(
        filteredRecipes: filteredRecipes,
        searchQuery: event.searchQuery,
        withImageOnly: event.withImageOnly,
        maxPrepTime: event.maxPrepTime,
        isTimeFilterApplied: event.isTimeFilterApplied,
      ),
    );
  }

  Future<void> _onRefreshRecipes(
    RefreshRecipesEvent event,
    Emitter<RecipeListState> emit,
  ) async {
    emit(RecipeListLoading());

    try {
      final response = await _apiService.getRecipes(offset: 0, limit: 10);
      await HiveService.saveRecipes(response);

      final filteredRecipes = _applyFilters(
        response,
        searchQuery: '',
        withImageOnly: false,
        maxPrepTime: null,
        isTimeFilterApplied: false,
      );

      emit(
        RecipeListLoaded(
          recipes: response,
          filteredRecipes: filteredRecipes,
          offset: response.length,
          hasMore: response.length == 10,
        ),
      );
    } catch (e) {
      emit(
        RecipeListError(errorMessage: "Ошибка при обновлении: ${e.toString()}"),
      );
    }
  }

  void _onToggleFiltersVisibility(
    ToggleFiltersVisibilityEvent event,
    Emitter<RecipeListState> emit,
  ) {
    if (state is! RecipeListLoaded) return;
    final currentState = state as RecipeListLoaded;

    emit(currentState.copyWith(showFilters: event.isVisible));
  }

  List<Recipe> _applyFilters(
    List<Recipe> allRecipes, {
    required String searchQuery,
    required bool withImageOnly,
    required int? maxPrepTime,
    required bool isTimeFilterApplied,
  }) {
    return allRecipes.where((recipe) {
      if (searchQuery.isNotEmpty) {
        final query = searchQuery.toLowerCase();
        final titleMatch = recipe.title?.toLowerCase().contains(query) ?? false;

        bool ingredientsMatch = false;
        if (recipe.ingredientsOne != null) {
          for (var ingredient in recipe.ingredientsOne!) {
            if (ingredient.title?.toLowerCase().contains(query) == true ||
                ingredient.text?.toLowerCase().contains(query) == true) {
              ingredientsMatch = true;
              break;
            }
          }
        }

        if (!titleMatch && !ingredientsMatch) return false;
      } 

      if (withImageOnly && recipe.image == null) return false;

      if (isTimeFilterApplied && maxPrepTime != null) {
        final prepTimeText = recipe.prepTime;
        if (prepTimeText == null) return false;

        final timeMatch = RegExp(r'\d+').firstMatch(prepTimeText);
        if (timeMatch == null) return false;

        final timeString = timeMatch.group(0);
        if (timeString == null) return false;

        final prepTimeValue = int.tryParse(timeString);
        if (prepTimeValue == null || prepTimeValue > maxPrepTime) {
          return false;
        }
      }

      return true;
    }).toList();
  }
}