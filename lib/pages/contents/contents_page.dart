import 'package:clone_empiricus_research/app/core/ui/extensions/size_screen_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:clone_empiricus_research/app/models/contents_model.dart';
import 'package:clone_empiricus_research/pages/contents/components/contents_list_tile.dart';
import 'package:flutter/material.dart';

class ContentsPage extends StatefulWidget {
  const ContentsPage({super.key});

  @override
  State<ContentsPage> createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage> {
  int indexContents = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.tertiaryContainer,
      appBar: AppBar(
        title: const Text(
          'Conteúdos',
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
                  Icons.search_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: context.width,
            height: 50,
            color: context.primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          indexContents = 0;
                          _scrollToCenter(0, context.width * 0.55);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Contenúdos Complementares',
                            style: TextStyle(
                              color: indexContents == 0
                                  ? context.secondaryColor
                                  : context.tertiaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 3,
                            decoration: BoxDecoration(
                              color: indexContents == 0
                                  ? context.secondaryColor
                                  : context.primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            width: context.width * 0.55,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            indexContents = 1;
                            _scrollToCenter(context.width * 0.55 + 30,
                                context.width * 0.45);
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Contenúdos BTG Pactual',
                              style: TextStyle(
                                color: indexContents == 1
                                    ? context.secondaryColor
                                    : context.tertiaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 3,
                              decoration: BoxDecoration(
                                color: indexContents == 1
                                    ? context.secondaryColor
                                    : context.primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              width: context.width * 0.45,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          indexContents = 2;
                          _scrollToCenter(
                              context.width * 0.55 +
                                  30 +
                                  context.width * 0.45 +
                                  30,
                              context.width * 0.45);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Kit Básico do Investidor',
                            style: TextStyle(
                              color: indexContents == 2
                                  ? context.secondaryColor
                                  : context.tertiaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 3,
                            decoration: BoxDecoration(
                              color: indexContents == 2
                                  ? context.secondaryColor
                                  : context.primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            width: context.width * 0.45,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ContentsListTile(
            contentsModel: ContentsModel(
              image: '',
              title: 'Day One',
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToCenter(double itemStart, double itemWidth) {
    final targetScroll = itemStart + (itemWidth / 2) - (context.width / 2) + 16;

    _scrollController.animateTo(
      targetScroll.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
