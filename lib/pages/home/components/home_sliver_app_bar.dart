import 'package:flutter/material.dart';

class HomeSliverAppBar extends StatelessWidget {
  final double expandedHeight;
  const HomeSliverAppBar({super.key, required this.expandedHeight});

  @override
  Widget build(BuildContext context) {
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

          return Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: 1.0 - scrollProgress,
                child: Image.asset(
                  'assets/images/btg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              // Sem overlay: quando colapsado, fica 100% cinza
            ],
          );
        },
      ),
    );
  }
}
