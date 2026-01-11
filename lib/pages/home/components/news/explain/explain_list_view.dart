import 'package:clone_empiricus_research/app/models/news_model.dart';
import 'package:clone_empiricus_research/pages/home/components/news/news_list_tile.dart';
import 'package:flutter/material.dart';

class ExplainListView extends StatefulWidget {
  final List<NewsModel> listNews;
  const ExplainListView({super.key, required this.listNews});

  @override
  State<ExplainListView> createState() => _ExplainListViewState();
}

class _ExplainListViewState extends State<ExplainListView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.listNews.length,
          (index) => NewsListTile(
            newsModel: widget.listNews[index],
          ),
        ),
      ),
    );
  }
}
