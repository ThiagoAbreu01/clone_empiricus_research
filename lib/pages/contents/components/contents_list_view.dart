import 'package:clone_empiricus_research/pages/contents/components/contents_list_tile.dart';
import 'package:clone_empiricus_research/pages/contents/contents_controller.dart';
import 'package:clone_empiricus_research/pages/contents/contents_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ContentsListView extends StatefulWidget {
  int index;
  ContentsListView({
    super.key,
    required this.index,
  });

  @override
  State<ContentsListView> createState() => _ContentsListViewState();
}

class _ContentsListViewState extends State<ContentsListView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ContentsController, ContentsState>(
        builder: (context, state) {
          if (widget.index == 0) {
            return Column(
              children: List.generate(
                state.listComplementary.length,
                (index) => ContentsListTile(
                  contentsModel: state.listComplementary[index],
                ),
              ),
            );
          } else if (widget.index == 1) {
            return Column(
              children: List.generate(
                state.listBTGPactual.length,
                (index) => ContentsListTile(
                  contentsModel: state.listBTGPactual[index],
                ),
              ),
            );
          } else {
            return Column(
              children: List.generate(
                state.listBasicInvestorKit.length,
                (index) => ContentsListTile(
                  contentsModel: state.listBasicInvestorKit[index],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
