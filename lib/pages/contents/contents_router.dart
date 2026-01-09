import 'package:clone_empiricus_research/app/data/contents_lists.dart';
import 'package:clone_empiricus_research/pages/contents/contents_controller.dart';
import 'package:clone_empiricus_research/pages/contents/contents_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentsRouter {
  Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ContentsLists(),
          ),
          Provider(
            create: (context) => ContentsController(
              contentsLists: context.read(),
            ),
          ),
        ],
        child: const ContentsPage(),
      );
}
