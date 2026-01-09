import 'package:clone_empiricus_research/app/models/contents_model.dart';
import 'package:clone_empiricus_research/pages/contents/components/contents_list_tile.dart';
import 'package:flutter/material.dart';

class ComplementaryContentListView extends StatefulWidget {
  const ComplementaryContentListView({super.key});

  @override
  State<ComplementaryContentListView> createState() =>
      _ComplementaryContentListViewState();
}

class _ComplementaryContentListViewState
    extends State<ComplementaryContentListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemBuilder: (context, index) => ContentsListTile(contentsModel: ContentsModel(image: '', title: ''),),
    );
  }
}
