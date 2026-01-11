import 'package:clone_empiricus_research/app/models/lives_model.dart';

class LivesData {
  final List<Map<String, String>> livesJson = [
    {
      'date': '2026-01-13T15:00:00-01:00',
      'title': 'Flash Trader',
      'description': 'Flash Trader - Plantão de \nDúvidas',
      'image': 'assets/images/homem_live.png',
    },
    {
      'date': '2026-01-14T15:00:00-01:00',
      'title': 'Os Melhores Fundos de Investimentos',
      'description': 'Os Melhores Fundos de Investimentos - Plantão de Dúvidas',
      'image': 'assets/images/mulher_live.png',
    },
    {
      'date': '2026-01-16T15:00:00-01:00',
      'title': 'Carteira Empiricus',
      'description': 'Carteiras Empiricus - Plantão de Dúvidas',
      'image': 'assets/images/homem_live_2.png',
    },
    {
      'date': '2026-01-17T15:00:00-01:00',
      'title': 'Renda Imobiliária',
      'description': 'Renda Imobiliária - Plantão de Dúvidas',
      'image': 'assets/images/homem_live_3.png',
    },
    {
      'date': '2026-01-18T15:00:00-01:00',
      'title': 'Carteira Empiricus',
      'description': 'Carteiras Empiricus - Plantão de Dúvidas',
      'image': 'assets/images/mulher_live_2.png',
    },
  ];

  List<LivesModel> _toModels(List<Map<String, String>> source) {
    return source.map(LivesModel.fromJson).toList();
  }

  Future<List<LivesModel>> getListLives() async {
    return _toModels(livesJson);
  }
}
