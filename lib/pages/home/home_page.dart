import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:clone_empiricus_research/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  int pageIndex = 1;

  late HomeController controller;

  @override
  void initState() {
    controller = context.read();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadAllLives();
      controller.loadAllMoneyTimesNews();
      controller.loadAllYourMoneyNews();
      controller.loadAllExplain();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.tertiaryContainer,
      body: CustomScrollView(
        slivers: [
          HomeSliverAppBar(expandedHeight: _expandedHeight),
      
          SliverPersistentHeader(
            pinned: true,
            delegate: HomeButtonsHeaderDelegate(
              minHeight: 60.0,
              maxHeight: 60.0,
              currentIndex: pageIndex,
              onIndexChanged: (int idx) {
                setState(() {
                  pageIndex = idx;
                });
              },
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
            ),
          ),
    
          SliverToBoxAdapter(
            child: HomeContentSection(
              pageIndex: pageIndex
            ),
          ),
        ],
      ),
    );
  }
}