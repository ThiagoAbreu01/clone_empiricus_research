import 'package:clone_empiricus_research/app/core/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:clone_empiricus_research/pages/contents/contents_router.dart';
import 'package:clone_empiricus_research/pages/home/home_router.dart';
import 'package:clone_empiricus_research/pages/more_options/more_options_page.dart';
import 'package:clone_empiricus_research/pages/warnings/warnings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';

class EmpiricusScreensView extends StatefulWidget {
  const EmpiricusScreensView({super.key});

  @override
  State<EmpiricusScreensView> createState() => _EmpiricusScreensViewState();
}

class _EmpiricusScreensViewState extends State<EmpiricusScreensView> {
  final List<String> titles = ['Home', 'Conteúdos', 'Avisos', 'Mais Opções'];

  int currentPageIndex = 0;

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.folder_open_outlined,
    Icons.notifications_outlined,
    Icons.menu_outlined,
  ];

  final List<Widget> screens = [
    HomeRouter().page,
    ContentsRouter().page,
    WarningsPage(),
    MoreOptionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentPageIndex,
        icons: icons,
        onTap: onTap,
        titles: titles
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            ),
            child: child,
          );
        },
        child: LazyIndexedStack(
          key: ValueKey<int>(currentPageIndex),
          index: currentPageIndex,
          children: screens,
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
}
