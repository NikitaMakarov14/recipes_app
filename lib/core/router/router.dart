import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';
import '../../domain/entities/response_entity.dart';
import '../../presentation/bloc/recipe_list_bloc.dart';
import '../../data/datasources/api_service.dart';
import '../../presentation/pages/recipe_list_screen.dart';
import '../../presentation/pages/recipe_detail_screen.dart';
import '../network/internet_provider.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: Scaffold(
            appBar: const _MainAppBar(),
            body: BlocProvider(
              create: (context) => RecipeListBloc(apiService: ApiService()),
              child: const RecipeListWidget(),
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: '/recipe/:id',
      pageBuilder: (context, state) {
        final recipe = state.extra as Recipe?;
        return MaterialPage<void>(
          key: state.pageKey,
          child: RecipeDetailScreen(recipe: recipe!),
        );
      },
    ),
  ],
);

class _MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MainAppBar();

  @override
  Widget build(BuildContext context) {
    final isOnline = context.watch<InternetProvider>().isOnline;

    return AppBar(
      title: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Рецепты',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              isOnline ? 'online' : 'offline',
              style: TextStyle(
                fontSize: 12,
                color: isOnline ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return IconButton(
              icon: Icon(
                themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                themeProvider.toggleTheme(!themeProvider.isDarkMode);
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
