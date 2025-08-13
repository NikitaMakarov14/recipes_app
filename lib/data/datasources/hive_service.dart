import 'package:hive/hive.dart';

import '../mappers/recipe_mapper.dart';
import '../models/recipe_model.dart';
import '../../domain/entities/response_entity.dart';

class HiveService {
  static const String _boxName = 'recipesBox';
  static const String _recipesKey = 'recipes';
  static const String _lastFetchKey = 'lastFetch';

  static Future<Box> _openBox() async {
    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox(_boxName);
    }
    return Hive.box(_boxName);
  }

  static Future<void> saveRecipes(List<Recipe> recipes) async {
    final box = await _openBox();
    
    final recipeModels = RecipeMapper.toRecipeModels(recipes);
    
    await box.put(_recipesKey, recipeModels);
    await box.put(_lastFetchKey, DateTime.now().toIso8601String());
  }

  static Future<List<Recipe>?> getRecipes() async {
    final box = await _openBox();
    final dynamic data = box.get(_recipesKey);
    
    if (data is List<RecipeModel>) {
      return RecipeMapper.toRecipeEntities(data);
    }
    return null;
  }

  static Future<DateTime?> getLastFetchTime() async {
    final box = await _openBox();
    final lastFetchString = box.get(_lastFetchKey) as String?;
    return lastFetchString != null ? DateTime.parse(lastFetchString) : null;
  }

  static Future<void> clearCache() async {
    final box = await _openBox();
    await box.delete(_recipesKey);
    await box.delete(_lastFetchKey);
  }
}