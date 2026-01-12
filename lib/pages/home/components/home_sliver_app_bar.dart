import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:clone_empiricus_research/app/models/news_model.dart';
import 'package:clone_empiricus_research/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSliverAppBar extends StatefulWidget {
  final double expandedHeight;
  const HomeSliverAppBar({super.key, required this.expandedHeight});
  @override
  State<HomeSliverAppBar> createState() => _HomeSliverAppBarState();
}

class _HomeSliverAppBarState extends State<HomeSliverAppBar>
    with SingleTickerProviderStateMixin {
  late HomeController controller;
  late AnimationController animationController;
  late Animation<double> _animation;
  int _current = 0;

  List<NewsModel> newsItems = [];

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    controller = context.read();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      newsItems = await controller.loadAllNews();
      setState(() {});
      _animation =
          CurvedAnimation(parent: animationController, curve: Curves.linear);
      animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _current = (_current + 1) % newsItems.length;
          });
          animationController.reset();
          animationController.forward();
        }
      });
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final expandedHeight = widget.expandedHeight;
    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      elevation: 0,
      backgroundColor: const Color(0xFF2A2A2A),
      leading: IconButton(
        icon: const Icon(Icons.person, color: Colors.white),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline, color: Colors.white),
          onPressed: () {},
        ),
      ],
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final scrollProgress = ((expandedHeight - constraints.maxHeight) /
                  (expandedHeight - kToolbarHeight))
              .clamp(0.0, 1.0);
          final visibleOpacity = (0.7 - scrollProgress).clamp(0.0, 1.0);
          final NewsModel? item =
              newsItems.isNotEmpty ? newsItems[_current] : null;
          return Builder(
            builder: (context) {
              if (newsItems.isEmpty) {
                return const SizedBox.shrink();
              } else {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Opacity(
                      opacity: visibleOpacity,
                      child: Image.asset(
                        item!.imageNews,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // ignore: deprecated_member_use
                    Container(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.25 * visibleOpacity)),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 10,
                      child: Opacity(
                        opacity: visibleOpacity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: context.secondaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                item.siteName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: item.description,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        TextSpan(
                                          text: ' Leia mais',
                                          style: TextStyle(
                                              color: context.secondaryColor,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  AnimatedBuilder(
                                    animation: _animation,
                                    builder: (context, child) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: LinearProgressIndicator(
                                          value: _animation.value,
                                          minHeight: 5,
                                          backgroundColor: Colors.grey,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }
}
