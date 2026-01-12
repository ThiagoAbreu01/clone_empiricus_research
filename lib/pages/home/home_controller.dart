
import 'package:bloc/bloc.dart';
import 'package:clone_empiricus_research/app/data/lives_data.dart';
import 'package:clone_empiricus_research/app/data/news_data.dart';
import 'package:clone_empiricus_research/app/models/news_model.dart';
import 'package:clone_empiricus_research/pages/home/home_state.dart';

class HomeController extends Cubit<HomeState>{
  final LivesData livesData;
  final NewsData newsData;
  HomeController({
    required this.livesData,
    required this.newsData,
  }) : super(
        HomeState(
          status: HomeStatus.initial,
          listLives: [],
          listMoneyTimesNews: [],
          listYourMoneyNews: [],
          listExplain: [],
        ),
      );

  Future<void> loadAllLives() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final lives = await livesData.getListLives();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          listLives: lives,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> loadAllMoneyTimesNews() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final moneyTimesNews = await newsData.getListMoneyTimesNews();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          listMoneyTimesNews: moneyTimesNews,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> loadAllYourMoneyNews() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final yourMoneyNews = await newsData.getListYourMoneyNews();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          listYourMoneyNews: yourMoneyNews,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> loadAllExplain() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final explain = await newsData.getListExplain();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          listExplain: explain,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
  
  Future<List<NewsModel>> loadAllNews() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final news = await newsData.getListNews();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          listExplain: news,
        ),
      );

      return news;
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
      return [];
    }
  }
}