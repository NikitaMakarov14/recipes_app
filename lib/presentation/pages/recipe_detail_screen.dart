import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/datasources/api_service.dart';
import '../../domain/entities/response_entity.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe? recipe;
  final String? recipeId;

  const RecipeDetailScreen({super.key, this.recipe, this.recipeId})
    : assert(
        recipe != null || recipeId != null,
        'Необходим recipe или recipeId',
      );

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late Future<Recipe?> _recipeFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();

    if (widget.recipe != null) {
      _recipeFuture = Future.value(widget.recipe);
    } else {
      _recipeFuture = _loadRecipeById(widget.recipeId!);
    }
  }

  Future<Recipe?> _loadRecipeById(String id) async {
    try {
      return await _apiService.getRecipeById(id);
    } catch (e) {
      debugPrint('Error loading recipe: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FutureBuilder<Recipe?>(
        future: _recipeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingIndicator();
          }

          if (snapshot.hasError || snapshot.data == null) {
            return _buildErrorWidget();
          }

          final recipe = snapshot.data!;
          return _buildRecipeContent(recipe);
        },
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Не удалось загрузить рецепт',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('Назад'),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeContent(Recipe recipe) {
    final textTheme = Theme.of(context).textTheme;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          flexibleSpace: FlexibleSpaceBar(
            background: recipe.image != null
                ? CachedNetworkImage(
                    imageUrl: recipe.image!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: scaffoldBackgroundColor),
                    errorWidget: (context, url, error) =>
                        Container(color: scaffoldBackgroundColor),
                  )
                : Container(color: scaffoldBackgroundColor),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => context.pop(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Заголовок
                Text(
                  recipe.title ?? 'Название отсутствует',
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Время приготовления
                if (recipe.prepTime != null)
                  Text(
                    '⏱ ${recipe.prepTime}',
                    style: textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                const SizedBox(height: 16),

                // Описание
                Text(
                  recipe.text ?? 'Описание отсутствует',
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),

                // Ингредиенты
                if (recipe.ingredientsOne != null)
                  _buildIngredients('Ингредиенты:', recipe.ingredientsOne!),
                if (recipe.ingredientsTwo != null)
                  _buildIngredients('Для соуса:', recipe.ingredientsTwo!),
                const SizedBox(height: 24),

                // Шаги приготовления
                if (recipe.steps != null && recipe.steps!.isNotEmpty)
                  _buildSteps(recipe.steps!),
                const SizedBox(height: 24),

                // Пищевая ценность
                if (recipe.energy != null && recipe.energy!.isNotEmpty)
                  _buildEnergyValues(recipe.energy!),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIngredients(String title, List<Ingredient> ingredients) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.titleLarge?.copyWith(fontSize: 20)),
        const SizedBox(height: 12),
        ...ingredients.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              '• ${e.title ?? ''} ${e.text ?? ''}',
              style: textTheme.bodyMedium,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSteps(List<RecipeStep> steps) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Шаги приготовления:',
          style: textTheme.titleLarge?.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 12),
        ...steps.asMap().entries.map((entry) {
          final index = entry.key + 1;
          final step = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$index. ${step.text ?? ''}', style: textTheme.bodyMedium),
                const SizedBox(height: 8),
                if (step.image1 != null || step.image2 != null)
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      if (step.image1 != null) _buildStepImage(step.image1!),
                      if (step.image2 != null) _buildStepImage(step.image2!),
                    ],
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildStepImage(String url) {
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return SizedBox(
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.contain,
        placeholder: (context, url) =>
            Container(height: 150, color: scaffoldBackgroundColor),
        errorWidget: (context, url, error) => Container(
          color: scaffoldBackgroundColor, 
          height: 40,
          child: Center(
            child: Icon(
              Icons.error_outline,
              size: 24,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEnergyValues(List<EnergyValue> energy) {
    final chipTheme = Theme.of(context).chipTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Пищевая ценность:',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: energy
              .map(
                (e) => Chip(
                  label: Text(
                    '${e.title}: ${e.text}',
                    style: chipTheme.labelStyle,
                  ),
                  backgroundColor: chipTheme.backgroundColor,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
