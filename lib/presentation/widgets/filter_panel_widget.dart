import 'package:flutter/material.dart';

import '../bloc/recipe_list_bloc.dart';

class FilterPanelWidget extends StatelessWidget {
  final RecipeListLoaded state;
  final VoidCallback onReset;
  final ValueChanged<FilterParams> onApply;
  final TextEditingController timeController;

  const FilterPanelWidget({
    super.key,
    required this.state,
    required this.onReset,
    required this.onApply,
    required this.timeController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: Colors.black),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Только с фото',
                  style: TextStyle(color: theme.textTheme.bodyMedium?.color),
                ),
                _buildCheckbox(theme),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Время приготовления',
                  style: TextStyle(color: theme.textTheme.bodyMedium?.color),
                ),
                _buildTimeField(theme),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_buildApplyButton(theme), _buildResetButton(theme)],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox(ThemeData theme) {
    return Theme(
      data: theme.copyWith(
        unselectedWidgetColor: theme.dividerColor,
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            return states.contains(WidgetState.selected)
                ? theme.primaryColor
                : Colors.transparent;
          }),
        ),
      ),
      child: Checkbox(
        value: state.withImageOnly,
        onChanged: (value) => onApply(
          FilterParams(withImage: value!, maxTime: state.maxPrepTime),
        ),
      ),
    );
  }

  Widget _buildTimeField(ThemeData theme) {
    return SizedBox(
      width: 120,
      child: TextField(
        controller: timeController,
        keyboardType: TextInputType.number,
        style: TextStyle(color: theme.textTheme.bodyMedium?.color),
        decoration: InputDecoration(
          hintText: 'до n минут',
          hintStyle: TextStyle(color: theme.hintColor),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: theme.dividerColor),
          ),
          filled: true,
          fillColor: theme.inputDecorationTheme.fillColor,
        ),
      ),
    );
  }

  Widget _buildApplyButton(ThemeData theme) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
        onPressed: () => onApply(
          FilterParams(
            withImage: state.withImageOnly,
            maxTime: int.tryParse(timeController.text),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColor,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          'Применить',
          style: TextStyle(
            fontSize: 16,
            color: theme.textTheme.bodyMedium?.color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildResetButton(ThemeData theme) {
    return ElevatedButton(
      onPressed: onReset,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.cardColor,
        foregroundColor: theme.textTheme.bodyMedium?.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: theme.dividerColor, width: 1),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
      child: Text(
        'Сбросить фильтры',
        style: TextStyle(
          fontSize: 16,
          color: theme.textTheme.bodyMedium?.color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class FilterParams {
  final bool withImage;
  final int? maxTime;

  FilterParams({required this.withImage, this.maxTime});
}
