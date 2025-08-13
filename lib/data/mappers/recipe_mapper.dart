import '../models/recipe_model.dart';
import '../../domain/entities/response_entity.dart';


class RecipeMapper {
  /// Преобразование data-модели ответа в domain-сущность
  static RecipeResponse toEntity(RecipeResponseModel model) {
    return RecipeResponse(
      news: model.news.map((model) => toRecipeEntity(model)).toList(),
    );
  }

  /// Преобразование data-модели рецепта в domain-сущность
  static Recipe toRecipeEntity(RecipeModel model) {
    return Recipe(
      id: model.id,
      title: model.title,
      text: model.text,
      image: model.image,
      steps: model.steps?.map(toStepEntity).toList(),
      prepTime: model.prepTime,
      energy: model.energy?.map(toEnergyEntity).toList(),
      ingredientsOne: model.ingredientsOne?.map(toIngredientEntity).toList(),
      ingredientsTwo: model.ingredientsTwo?.map(toIngredientEntity).toList(),
      dateAdded: model.dateAdded,
      link: model.link,
    );
  }

  /// Преобразование data-модели шага в domain-сущность
  static RecipeStep toStepEntity(RecipeStepModel model) {
    return RecipeStep(
      text: model.text,
      image1: model.image1,
      image2: model.image2,
    );
  }

  /// Преобразование data-модели энерг. ценности в domain-сущность
  static EnergyValue toEnergyEntity(EnergyValueModel model) {
    return EnergyValue(
      title: model.title,
      text: model.text,
    );
  }

  /// Преобразование data-модели ингредиента в domain-сущность
  static Ingredient toIngredientEntity(IngredientModel model) {
    return Ingredient(
      title: model.title,
      text: model.text,
    );
  }

  /// Преобразование domain-сущности рецепта в data-модель
  static RecipeModel toRecipeModel(Recipe entity) {
    return RecipeModel(
      id: entity.id,
      title: entity.title,
      text: entity.text,
      image: entity.image,
      steps: entity.steps?.map(toStepModel).toList(),
      prepTime: entity.prepTime,
      energy: entity.energy?.map(toEnergyModel).toList(),
      ingredientsOne: entity.ingredientsOne?.map(toIngredientModel).toList(),
      ingredientsTwo: entity.ingredientsTwo?.map(toIngredientModel).toList(),
      dateAdded: entity.dateAdded,
      link: entity.link,
    );
  }

  /// Преобразование domain-сущности шага в data-модель
  static RecipeStepModel toStepModel(RecipeStep entity) {
    return RecipeStepModel(
      text: entity.text,
      image1: entity.image1,
      image2: entity.image2,
    );
  }

  /// Преобразование domain-сущности энерг. ценности в data-модель
  static EnergyValueModel toEnergyModel(EnergyValue entity) {
    return EnergyValueModel(
      title: entity.title,
      text: entity.text,
    );
  }

  /// Преобразование domain-сущности ингредиента в data-модель
  static IngredientModel toIngredientModel(Ingredient entity) {
    return IngredientModel(
      title: entity.title,
      text: entity.text,
    );
  }

  /// Преобразование списка domain-сущностей в список data-моделей
  static List<RecipeModel> toRecipeModels(List<Recipe> entities) {
    return entities.map(toRecipeModel).toList();
  }

  /// Преобразование списка data-моделей в список domain-сущностей
  static List<Recipe> toRecipeEntities(List<RecipeModel> models) {
    return models.map(toRecipeEntity).toList();
  }
}