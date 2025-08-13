import '../entities/response_entity.dart';

abstract class RecipeRepository {

  Future<List<Recipe>> getRecipes({
    bool forceRefresh = false,
    int offset = 0,
    int limit = 10,
  });

  /// Получение конкретного рецепта по ID (в API не предполагается)
  Future<Recipe> getRecipeById(String id);
  
}