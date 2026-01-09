import 'package:clone_empiricus_research/app/core/ui/extensions/size_screen_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/styles/theme/custom_theme_switcher.dart';
import 'package:flutter/material.dart';

class MoreOptionsPage extends StatefulWidget {
  const MoreOptionsPage({super.key});

  @override
  State<MoreOptionsPage> createState() => _MoreOptionsPageState();
}

class _MoreOptionsPageState extends State<MoreOptionsPage> {
  String selectedTheme = 'light';

  @override
  void initState() {
    super.initState();
    final theme = CustomThemeSwitcher.themeNotifier.value;
    selectedTheme = theme.colorScheme.brightness == Brightness.light ? 'light' : 'dark';
    CustomThemeSwitcher.themeNotifier.addListener(_syncSelectedWithTheme);
  }

  void _syncSelectedWithTheme() {
    final theme = CustomThemeSwitcher.themeNotifier.value;
    final newSelected = theme.colorScheme.brightness == Brightness.light ? 'light' : 'dark';
    if (selectedTheme != newSelected) {
      setState(() {
        selectedTheme = newSelected;
      });
    }
  }

  @override
  void dispose() {
    CustomThemeSwitcher.themeNotifier.removeListener(_syncSelectedWithTheme);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.tertiaryContainer,
      appBar: AppBar(
        title: const Text(
          'Mais Opções',
          style: TextStyle(fontSize: 20, color: Colors.white),
          
        ),
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
        actions: [
          Material(
            color: Color.fromARGB(255, 41, 41, 41),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: 70,
                child: Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: context.primaryColor,
        height: 190,
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Aparência',
                style: TextStyle(
                  color: context.tertiaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            RadioListTile<String>(
              value: 'light',
              groupValue: selectedTheme,
              onChanged: (value) {
                setState(() => selectedTheme = value ?? 'light');
                CustomThemeSwitcher.switchToLightTheme();
              },
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: Colors.blue,
              title: Text(
                'Modo Claro',
                style: TextStyle(color: context.tertiaryColor),
              ),
              secondary: Icon(
                Icons.light_mode_outlined,
                color: context.tertiaryColor,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: const Color.fromARGB(255, 52, 52, 52),
                height: 0.8,
              ),
            ),
            RadioListTile<String>(
              value: 'dark',
              groupValue: selectedTheme,
              onChanged: (value) {
                setState(() => selectedTheme = value ?? 'dark');
                CustomThemeSwitcher.switchToDarkTheme();
              },
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: Colors.blue,
              title: Text(
                'Modo Escuro',
                style: TextStyle(color: context.tertiaryColor),
              ),
              secondary: Icon(
                Icons.dark_mode_outlined,
                color: context.tertiaryColor,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: const Color.fromARGB(255, 52, 52, 52),
                height: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
