import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/themes/theme_provider.dart';
import 'core/themes/app_themes.dart';
import 'core/network/internet_provider.dart';
import 'data/models/recipe_model.dart';
import 'core/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeResponseModelAdapter());
  Hive.registerAdapter(RecipeModelAdapter());
  Hive.registerAdapter(RecipeStepModelAdapter());
  Hive.registerAdapter(EnergyValueModelAdapter());
  Hive.registerAdapter(IngredientModelAdapter());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => InternetProvider(), lazy: false),
      ],
      child: const RecipeApp(),
    ),
  );
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeProvider.themeMode,
          routerConfig: appRouter,
          builder: (context, child) {
            return AnimatedTheme(
              data: Theme.of(context),
              duration: const Duration(milliseconds: 300),
              child: child!,
            );
          },
        );
      },
    );
  }
}
