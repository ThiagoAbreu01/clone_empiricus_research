import 'package:clone_empiricus_research/app/data/contents_data.dart';
import 'package:clone_empiricus_research/pages/contents/contents_controller.dart';
import 'package:clone_empiricus_research/pages/contents/contents_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentsRouter {
  Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ContentsData(),
          ),
          Provider(
            create: (context) => ContentsController(
              contentsData: context.read(),
            ),
          ),
        ],
        child: const ContentsPage(),
      );
}
