import 'dart:io';
import '../../domain/repositories/recipe_repository.dart';
import '../../domain/entities/response_entity.dart';
import '../datasources/api_service.dart';
import '../datasources/hive_service.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final ApiService apiService;
  final Duration cacheDuration;

  RecipeRepositoryImpl({
    required this.apiService,
    this.cacheDuration = const Duration(hours: 1),
  });

  @override
  Future<List<Recipe>> getRecipes({
    bool forceRefresh = false,
    int offset = 0,
    int limit = 10,
  }) async {
    try {
      // Проверка актуальности кеша
      final shouldUseCache = !forceRefresh && 
          await _isCacheValid() && 
          offset == 0; // Кеш только для первой страницы

      if (shouldUseCache) {
        final cachedRecipes = await HiveService.getRecipes();
        if (cachedRecipes != null && cachedRecipes.isNotEmpty) {
          return cachedRecipes;
        }
      }

      // Загрузка свежих данных из сети
      final freshRecipes = await apiService.getRecipes(offset: offset, limit: limit);
      
      // Сохранение в кеш только первой страницы
      if (offset == 0) {
        await HiveService.saveRecipes(freshRecipes);
      }
      
      return freshRecipes;
    } on SocketException catch (_) {
      // Обработка отсутствия интернета
      final cachedRecipes = await HiveService.getRecipes();
      if (cachedRecipes != null && cachedRecipes.isNotEmpty) {
        return cachedRecipes;
      }
      throw Exception('No internet connection and no cached data');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Recipe> getRecipeById(String id) async {
    try {
      return await apiService.getRecipeById(id);
    } catch (e) {
      // Попытка найти рецепт в кеше
      final allRecipes = await HiveService.getRecipes();
      if (allRecipes != null) {
        try {
          return allRecipes.firstWhere((recipe) => recipe.id == id);
        } catch (_) {
          throw e;
        }
      }
      throw e;
    }
  }

  /// Проверяет актуальность кеша
  Future<bool> _isCacheValid() async {
    final lastFetch = await HiveService.getLastFetchTime();
    if (lastFetch == null) return false;
    return DateTime.now().difference(lastFetch) < cacheDuration;
  }
}