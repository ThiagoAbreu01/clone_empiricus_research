// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clone_empiricus_research/app/models/contents_model.dart';

enum ContentsStatus { initial, loading, success, failure }
class ContentsState {
  final ContentsStatus status;
  final List<ContentsModel> listComplementary;
  final List<ContentsModel> listBTGPactual;
  final List<ContentsModel> listBasicInvestorKit;
  final String? successMessage;
  final String? errorMessage;
  ContentsState({
    required this.status,
    required this.listComplementary,
    required this.listBTGPactual,
    required this.listBasicInvestorKit,
    this.successMessage,
    this.errorMessage,
  });
  

  ContentsState copyWith({
    ContentsStatus? status,
    List<ContentsModel>? listComplementary,
    List<ContentsModel>? listBTGPactual,
    List<ContentsModel>? listBasicInvestorKit,
    String? successMessage,
    String? errorMessage,
  }) {
    return ContentsState(
      status: status ?? this.status,
      listComplementary: listComplementary ?? this.listComplementary,
      listBTGPactual: listBTGPactual ?? this.listBTGPactual,
      listBasicInvestorKit: listBasicInvestorKit ?? this.listBasicInvestorKit,
      successMessage: successMessage,
      errorMessage: errorMessage,
    );
  }
}
