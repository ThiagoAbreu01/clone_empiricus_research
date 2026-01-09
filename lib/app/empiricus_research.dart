import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:clone_empiricus_research/app/core/ui/styles/theme/custom_theme_switcher.dart';
import 'package:clone_empiricus_research/pages/empiricus_screens_view.dart';
import 'package:flutter/material.dart';

class EmpiricusResearch extends StatelessWidget {
  const EmpiricusResearch({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: CustomThemeSwitcher.themeType,
      child: ValueListenableBuilder<ThemeData>(
        valueListenable: CustomThemeSwitcher.themeNotifier,
        builder: (_, theme, __) {
          return MaterialApp(
            title: 'Empiricus Research',
            debugShowCheckedModeBanner: false,
            theme: theme,
            routes: {'/': (context) => const EmpiricusScreensView()},
          );
        },
      ),
    );
  }
}
