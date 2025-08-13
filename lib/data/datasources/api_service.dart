import 'dart:convert';
import 'package:dio/dio.dart';

import '../mappers/recipe_mapper.dart'; 
import '../models/recipe_model.dart';
import '../../domain/entities/response_entity.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://madeindream.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.plain,
    ),
  );

  ApiService() {
    _dio.interceptors.add(
      LogInterceptor(request: true, responseBody: true, error: true),
    );
  }

  Future<Recipe> getRecipeById(String id) async {
    try {
      final response = await _dio.get(
        '/index.php',
        queryParameters: {'route': 'api/app/getRecipe', 'id': id},
      );

      if (response.data == null || response.data.isEmpty) {
        throw Exception('Empty response from server for recipe $id');
      }

      final decoded = jsonDecode(response.data);
      RecipeModel recipeModel;

      if (decoded is Map<String, dynamic>) {
        if (decoded.containsKey('recipe')) {
          recipeModel = RecipeModel.fromJson(decoded['recipe']);
        } else {
          recipeModel = RecipeModel.fromJson(decoded);
        }
      } else {
        throw Exception('Unexpected response format for recipe $id');
      }

      return RecipeMapper.toRecipeEntity(recipeModel);
    } on DioException catch (e) {
      throw Exception('Network error while loading recipe $id: ${e.message}');
    } on FormatException catch (e) {
      throw Exception('JSON parsing error for recipe $id: $e');
    } catch (e) {
      throw Exception('Unexpected error while loading recipe $id: $e');
    }
  }

  Future<List<Recipe>> getRecipes({int offset = 0, int limit = 10}) async {
    try {
      final response = await _dio.get(
        '/index.php',
        queryParameters: {
          'route': 'api/app/getRecipes',
          'offset': offset,
          'limit': limit,
        },
      );

      if (response.data == null || response.data.isEmpty) {
        throw Exception('Empty response from server');
      }

      final decoded = jsonDecode(response.data);
      List<RecipeModel> recipeModels = [];

      if (decoded is List) {
        recipeModels = decoded.map((e) => RecipeModel.fromJson(e)).toList();
      } else if (decoded is Map<String, dynamic>) {
        if (decoded.containsKey('news')) {
          final recipeResponse = RecipeResponseModel.fromJson(decoded);
          recipeModels = recipeResponse.news;
        } else {
          throw Exception('Unexpected response format: missing "news" field');
        }
      } else {
        throw Exception('Unexpected response type');
      }

      return RecipeMapper.toRecipeEntities(recipeModels);
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on FormatException catch (e) {
      throw Exception('JSON parsing error: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}