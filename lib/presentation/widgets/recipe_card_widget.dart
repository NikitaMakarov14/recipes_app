import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../domain/entities/response_entity.dart';
import '../../core/constants/app_textstyles.dart';

class RecipeCardWidget extends StatelessWidget {
  final Recipe recipe;
  
  const RecipeCardWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyMedium?.color ?? Colors.black;
    String? shortText = recipe.text;

    if (shortText != null && shortText.length > 80) {
      shortText = '${shortText.substring(0, 80)}...';
    }

    return InkWell(
      key: Key(recipe.id.toString()),
      onTap: () => context.push('/recipe/${recipe.id}', extra: recipe),
      child: Card(
        color: theme.cardColor,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(width: 1, color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImage(theme),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.title ?? 'Название отсутствует',
                      style: AppTextStyles.title().copyWith(color: textColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    if (recipe.prepTime != null)
                      Text(
                        'Время приготовления: ${recipe.prepTime}',
                        style: AppTextStyles.prepTime().copyWith(color: textColor),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      shortText ?? 'Описание отсутствует',
                      style: AppTextStyles.desc().copyWith(color: textColor),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(ThemeData theme) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.cardColor.withOpacity(0.3),
      ),
      child: recipe.image != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: recipe.image!,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(color: theme.cardColor.withOpacity(0.3)),
                errorWidget: (_, __, ___) => Icon(
                  Icons.error,
                  color: theme.colorScheme.error,
                ),
              ),
            )
          : Center(
              child: Icon(
                Icons.fastfood,
                size: 40,
                color: theme.colorScheme.onSurface.withOpacity(0.3),
              ),
            ),
    );
  }
}