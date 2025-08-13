class RecipeResponse {
  final List<Recipe> news;

  RecipeResponse({required this.news});
}

class Recipe {
  final String id;
  final String? title;
  final String? text;
  final String? image;
  final List<RecipeStep>? steps;
  final String? prepTime;
  final List<EnergyValue>? energy;
  final List<Ingredient>? ingredientsOne;
  final List<Ingredient>? ingredientsTwo;
  final String? dateAdded;
  final String? link;

  Recipe({
    required this.id,
    this.title,
    this.text,
    this.image,
    this.steps,
    this.prepTime,
    this.energy,
    this.ingredientsOne,
    this.ingredientsTwo,
    this.dateAdded,
    this.link,
  });
}

class RecipeStep {
  final String? text;
  final String? image1;
  final String? image2;

  RecipeStep({this.text, this.image1, this.image2});
}

class EnergyValue {
  final String? title;
  final String? text;

  EnergyValue({this.title, this.text});
}

class Ingredient {
  final String? title;
  final String? text;

  Ingredient({this.title, this.text});
}