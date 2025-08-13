import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/response_entity.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
@HiveType(typeId: 0)
class RecipeResponseModel extends RecipeResponse with _$RecipeResponseModel {
  @HiveField(1)
  factory RecipeResponseModel({@HiveField(1) required List<RecipeModel> news}) =
      _RecipeResponseModel;

  factory RecipeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseModelFromJson(json);
}

@freezed
@HiveType(typeId: 1)
class RecipeModel extends Recipe with _$RecipeModel {
  @HiveField(0)
  factory RecipeModel({
    @HiveField(1) required String id,
    @HiveField(2) String? title,
    @HiveField(3) String? text,
    @HiveField(4) String? image,
    @HiveField(5) List<RecipeStepModel>? steps,
    @JsonKey(name: 'prep_time') @HiveField(6) String? prepTime,
    @HiveField(7) List<EnergyValueModel>? energy,
    @JsonKey(name: 'ingredients_one')
    @HiveField(8)
    List<IngredientModel>? ingredientsOne,
    @JsonKey(name: 'ingredients_two')
    @HiveField(9)
    List<IngredientModel>? ingredientsTwo,
    @JsonKey(name: 'date_added') @HiveField(10) String? dateAdded,
    @HiveField(11) String? link,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}

@freezed
@HiveType(typeId: 2)
class RecipeStepModel extends RecipeStep with _$RecipeStepModel {
  @HiveField(0)
  factory RecipeStepModel({
    @HiveField(1) String? text,
    @HiveField(2) String? image1,
    @HiveField(3) String? image2,
  }) = _RecipeStepModel;

  factory RecipeStepModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepModelFromJson(json);
}

@freezed
@HiveType(typeId: 3)
class EnergyValueModel extends EnergyValue with _$EnergyValueModel {
  @HiveField(0)
  factory EnergyValueModel({
    @HiveField(1) String? title,
    @HiveField(2) String? text,
  }) = _EnergyValueModel;

  factory EnergyValueModel.fromJson(Map<String, dynamic> json) =>
      _$EnergyValueModelFromJson(json);
}

@freezed
@HiveType(typeId: 4)
class IngredientModel extends Ingredient with _$IngredientModel {
  @HiveField(0)
  factory IngredientModel({
    @HiveField(1) String? title,
    @HiveField(2) String? text,
  }) = _IngredientModel;

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);
}
