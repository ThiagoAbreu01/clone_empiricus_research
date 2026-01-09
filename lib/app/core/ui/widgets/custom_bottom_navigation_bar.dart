import 'package:clone_empiricus_research/app/core/ui/extensions/size_screen_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final List<IconData> icons;
  final Function(int newIndex) onTap;
  final List<String>? titles;
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.icons,
    required this.onTap,
    required this.titles,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    switch (widget.icons.length) {
      case 2:
        return buildDualNavigationBar();
      case 3:
        return buildTripleNavigationBar();
      case 4:
        return buildQuadrupleNavigationBar();
      case 5:
        return buildPentaNavigationBar();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget buildDualNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Builder(
          builder: (context) {
            return Container(
              height: 70,
              width: context.width,
              decoration: BoxDecoration(
                color: context.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: context.primaryColor.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Builder(
                builder: (context) {
                  List<Widget> itemsList = [const Spacer()];
                  double iconWidth = context.width * 0.25;
                  for (int i = 0; i < widget.icons.length; i++) {
                    if (i != 0) {
                      itemsList.add(const Spacer());
                    }
                    itemsList.add(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color:
                                i == widget.currentIndex
                                    ? context.tertiaryColor
                                    : context.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                widget.onTap(i);
                              },
                              splashColor: context.secondaryColor,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: iconWidth,
                                height: 35,
                                child: Icon(
                                  widget.icons[i],
                                  color:
                                      i == widget.currentIndex
                                          ? context.primaryColor
                                          : context.secondaryColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            widget.titles![i],
                            style: TextStyle(
                              color:
                                  i == widget.currentIndex
                                      ? context.secondaryColor
                                      : context.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                    if (i != 1) {
                      itemsList.add(const Spacer());
                    }
                  }
                  return Row(children: itemsList);
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildTripleNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Builder(
          builder: (context) {
            return Container(
              height: 70,
              width: context.width,
              decoration: BoxDecoration(
                color: context.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: context.primaryColor.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Builder(
                builder: (context) {
                  List<Widget> itemsList = [const Spacer()];
                  double iconWidth = context.width * 0.20;
                  for (int i = 0; i < widget.icons.length; i++) {
                    if (i != 0) {
                      itemsList.add(const Spacer());
                    }
                    itemsList.add(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color:
                                i == widget.currentIndex
                                    ? context.tertiaryColor
                                    : context.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                widget.onTap(i);
                              },
                              splashColor: context.secondaryColor,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: iconWidth,
                                height: 35,
                                child: Icon(
                                  widget.icons[i],
                                  color:
                                      i == widget.currentIndex
                                          ? context.primaryColor
                                          : context.secondaryColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            widget.titles![i],
                            style: TextStyle(
                              color:
                                  i == widget.currentIndex
                                      ? context.secondaryColor
                                      : context.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                    if (i != 2) {
                      itemsList.add(const Spacer());
                    }
                  }
                  return Row(children: itemsList);
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildQuadrupleNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Builder(
          builder: (context) {
            return Container(
              height: 70,
              width: context.width,
              decoration: BoxDecoration(
                color: context.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: context.primaryColor.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Builder(
                builder: (context) {
                  List<Widget> itemsList = [const Spacer()];
                  double iconWidth = context.width * 0.15;
                  for (int i = 0; i < widget.icons.length; i++) {
                    if (i != 0) {
                      itemsList.add(const Spacer());
                    }
                    itemsList.add(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color:
                                i == widget.currentIndex
                                    ? context.secondaryColor.withValues(alpha: 0.6)
                                    : context.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                widget.onTap(i);
                              },
                              splashColor: context.tertiaryColor,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: iconWidth,
                                height: 35,
                                child: Icon(
                                  widget.icons[i],
                                  color:
                                      i == widget.currentIndex
                                          ? context.primaryColor
                                          : context.tertiaryColor,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            widget.titles![i],
                            style: TextStyle(
                              color: context.tertiaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                    if (i != 4) {
                      itemsList.add(const Spacer());
                    }
                  }
                  return Row(children: itemsList);
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildPentaNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Builder(
          builder: (context) {
            return Container(
              height: 70,
              width: context.width,
              decoration: BoxDecoration(
                color: context.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: context.primaryColor.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Builder(
                builder: (context) {
                  List<Widget> itemsList = [const Spacer()];
                  double iconWidth = context.width * 0.12;
                  for (int i = 0; i < widget.icons.length; i++) {
                    if (i != 0) {
                      itemsList.add(const Spacer());
                    }
                    itemsList.add(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color:
                                i == widget.currentIndex
                                    ? context.tertiaryColor
                                    : context.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                widget.onTap(i);
                              },
                              splashColor: context.secondaryColor,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: iconWidth,
                                height: 35,
                                child: Icon(
                                  widget.icons[i],
                                  color:
                                      i == widget.currentIndex
                                          ? context.primaryColor
                                          : context.secondaryColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            widget.titles![i],
                            style: TextStyle(
                              color:
                                  i == widget.currentIndex
                                      ? context.secondaryColor
                                      : context.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                    if (i != 4) {
                      itemsList.add(const Spacer());
                    }
                  }
                  return Row(children: itemsList);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
