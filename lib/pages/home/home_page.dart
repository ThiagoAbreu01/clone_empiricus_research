import 'package:flutter/material.dart';
import 'components/home_sliver_app_bar.dart';
import 'components/home_buttons_header_delegate.dart';
import 'components/home_content_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double _expandedHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          HomeSliverAppBar(expandedHeight: _expandedHeight),

          SliverPersistentHeader(
            pinned: true,
            delegate: HomeButtonsHeaderDelegate(
              minHeight: 60.0,
              maxHeight: 60.0,
            ),
          ),

          // Área de conteúdo principal: Column abaixo do painel
          SliverToBoxAdapter(
            child: const HomeContentSection(),
          ),
        ],
      ),
    );
  }
}

// Delegate extraído para components/home_buttons_header_delegate.dart
