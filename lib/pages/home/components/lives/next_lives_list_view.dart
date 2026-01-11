import 'package:clone_empiricus_research/app/models/lives_model.dart';
import 'package:clone_empiricus_research/pages/home/components/lives/next_lives_list_tile.dart';
import 'package:flutter/material.dart';

class NextLivesListView extends StatefulWidget {
  final List<LivesModel> listLives;
  const NextLivesListView({super.key, required this.listLives});

  @override
  State<NextLivesListView> createState() => _NextLivesListViewState();
}

class _NextLivesListViewState extends State<NextLivesListView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.listLives.length,
          (index) => NextLivesListTile(
            livesModel: widget.listLives[index],
          ),
        ),
      ),
    );
  }
}
