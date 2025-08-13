import 'package:flutter/material.dart';

import '../bloc/recipe_list_bloc.dart';

class SearchFieldWidget extends StatelessWidget {
  final RecipeListLoaded state;
  final TextEditingController controller;
  final VoidCallback onClear;
  final ValueChanged<bool> onToggleFilters;
  
  const SearchFieldWidget({
    super.key,
    required this.state,
    required this.controller,
    required this.onClear,
    required this.onToggleFilters,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(color: theme.textTheme.bodyMedium?.color),
        decoration: InputDecoration(
          hintText: 'Поиск по названию или ингредиентам',
          prefixIcon: Icon(Icons.search, color: theme.primaryColor),
          suffixIcon: _buildSuffixIcons(theme),
          border: _buildBorder(theme),
          filled: true,
          fillColor: theme.inputDecorationTheme.fillColor,
        ),
      ),
    );
  }

  InputBorder _buildBorder(ThemeData theme) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: theme.dividerColor),
    );
  }

  Widget _buildSuffixIcons(ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (controller.text.isNotEmpty)
          IconButton(
            icon: Icon(Icons.clear, color: theme.primaryColor),
            onPressed: onClear,
          ),
        IconButton(
          icon: Icon(
            Icons.tune,
            color: state.showFilters 
                ? theme.colorScheme.secondary 
                : theme.primaryColor,
          ),
          onPressed: () {
            onToggleFilters(!state.showFilters);
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ],
    );
  }
}