import 'package:clone_empiricus_research/app/data/lives_data.dart';
import 'package:clone_empiricus_research/app/data/news_data.dart';
import 'package:clone_empiricus_research/pages/home/home_controller.dart';
import 'package:clone_empiricus_research/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => LivesData(),
          ),
          Provider(
            create: (context) => NewsData(),
          ),
          Provider(
            create: (context) => HomeController(
              livesData: context.read(),
              newsData: context.read(),
            ),
          ),
        ],
        child: HomePage(),
      );
}
