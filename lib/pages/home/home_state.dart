// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clone_empiricus_research/app/models/lives_model.dart';
import 'package:clone_empiricus_research/app/models/news_model.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState {
  final HomeStatus status;
  final List<LivesModel> listLives;
  final List<NewsModel> listMoneyTimesNews;
  final List<NewsModel> listYourMoneyNews;
  final List<NewsModel> listExplain;
  final String? errorMessage;
  final String? successMessage;
  HomeState({
    required this.status,
    required this.listLives,
    required this.listMoneyTimesNews,
    required this.listYourMoneyNews,
    required this.listExplain ,
    this.errorMessage,
    this.successMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<LivesModel>? listLives,
    List<NewsModel>? listMoneyTimesNews,
    List<NewsModel>? listYourMoneyNews,
    List<NewsModel>? listExplain,
    String? errorMessage,
    String? successMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      listLives: listLives ?? this.listLives,
      listMoneyTimesNews: listMoneyTimesNews ?? this.listMoneyTimesNews,
      listYourMoneyNews: listYourMoneyNews ?? this.listYourMoneyNews,
      listExplain: listExplain ?? this.listExplain,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }
}
