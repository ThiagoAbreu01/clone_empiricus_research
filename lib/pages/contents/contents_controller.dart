// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';

import 'package:clone_empiricus_research/app/data/contents_lists.dart';
import 'package:clone_empiricus_research/app/models/contents_model.dart';
import 'package:clone_empiricus_research/pages/contents/contents_state.dart';

class ContentsController extends Cubit<ContentsState> {
  final ContentsLists contentsLists;
  ContentsController({
    required this.contentsLists,
  }) : super(
          ContentsState(
            status: ContentsStatus.initial,
            listComplementary: [],
            listBTGPactual: [],
            listBasicInvestorKit: [],
          ),
        );

  Future<List<ContentsModel>> getListComplementaryContent() async {
    try {
      emit(state.copyWith(status: ContentsStatus.loading));

      final list = await contentsLists.getListComplementaryContent();

      emit(
        state.copyWith(
          status: ContentsStatus.success,
          listComplementary: list,
        ),
      );
      return list;
    } catch (e) {
      emit(
        state.copyWith(
          status: ContentsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
      return [];
    }
  }

  Future<List<ContentsModel>> getListBTGPactualContent() async {
    try {
      emit(state.copyWith(status: ContentsStatus.loading));

      final list = await contentsLists.getListBTGPactualContent();

      emit(
        state.copyWith(
          status: ContentsStatus.success,
          listBTGPactual: list,
        ),
      );
      return list;
    } catch (e) {
      emit(
        state.copyWith(
          status: ContentsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
      return [];
    }
    }

  Future<List<ContentsModel>> getListBasicInvestorKitContent() async {
    try {
      emit(state.copyWith(status: ContentsStatus.loading));

      final list = await contentsLists.getListBasicInvestorKitContent();
      
      emit(
        state.copyWith(
          status: ContentsStatus.success,
          listBasicInvestorKit: list,
        ),
      );
      return list;
    } catch (e) {
      emit(
        state.copyWith(
          status: ContentsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
      return [];
    }
  }
}
