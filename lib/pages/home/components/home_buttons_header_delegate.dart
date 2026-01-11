import 'package:clone_empiricus_research/app/core/ui/extensions/size_screen_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/styles/theme/custom_theme_switcher.dart';
import 'package:clone_empiricus_research/app/core/ui/styles/theme/theme_data.dart';
import 'package:flutter/material.dart';

class HomeButtonsHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Function()? onTap;
  final ValueChanged<int>? onIndexChanged;
  final int currentIndex;

  HomeButtonsHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    this.onTap,
    this.onIndexChanged,
    this.currentIndex = 0,
  });
  
  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double currentHeight =
        (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);

    return SizedBox(
      height: currentHeight,
      child: Container(
        width: context.width,
        color: context.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: currentIndex == 0 ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                    onTap: () => onIndexChanged?.call(0),
                    child: Container(
                      height: 36,
                      width: context.percentWidth(0.3),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        ),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builder(
                            builder: (context) {
                              if (currentIndex == 0) {
                                return Icon(
                                  Icons.check,
                                  size: 18,
                                  color: Colors.white,
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Meu Painel',
                            style: TextStyle(
                              color: currentIndex == 0
                                  ? Colors.white
                                  : CustomThemeSwitcher.themeType ==
                                          AppLightTheme.data
                                      ? Colors.black
                                      : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  color: currentIndex == 1 ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    onTap: () => onIndexChanged?.call(1),
                    child: Container(
                      height: 36,
                      width: context.percentWidth(0.3),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builder(
                            builder: (context) {
                              if (currentIndex == 1) {
                                return Icon(
                                  Icons.check,
                                  size: 18,
                                  color: Colors.white,
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Explorar',
                            style: TextStyle(
                              color: currentIndex == 1
                                  ? Colors.white
                                  : CustomThemeSwitcher.themeType ==
                                          AppLightTheme.data
                                      ? Colors.black
                                      : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant HomeButtonsHeaderDelegate oldDelegate) {
    return minHeight != oldDelegate.minHeight ||
        maxHeight != oldDelegate.maxHeight ||
        currentIndex != oldDelegate.currentIndex ||
        onIndexChanged != oldDelegate.onIndexChanged;
  }
}
