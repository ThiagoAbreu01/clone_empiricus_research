import 'package:clone_empiricus_research/app/models/contents_model.dart';

class ContentsLists {
  final List<Map<String, String>> complementaryContentJson = [
    {
      'image': 'assets/images/day_one.jpeg',
      'title': 'Day One',
    },
    {
      'image': 'assets/images/invest.jpeg',
      'title': 'Invest',
    },
    {
      'image': 'assets/images/diretor.jpeg',
      'title': 'Empiricus 24/07',
    },
  ];

  final List<Map<String, String>> btgPactualContentJson = [
    {
      'image': 'assets/images/btg.jpg',
      'title': 'BTG Pactual',
    },
  ];

  final List<Map<String, String>> basicInvestorKitContentJson = [
    {
      'image': 'assets/images/empiricus.png',
      'title': 'Kit Básico do Investidor | Ações',
    },
    {
      'image': 'assets/images/empiricus.png',
      'title': 'Kit Básico do Investidor | Fundos Imobiliários',
    },
    {
      'image': 'assets/images/empiricus.png',
      'title': 'Kit Básico do Investidor | Renda Fixa',
    },
    {
      'image': 'assets/images/empiricus.png',
      'title': 'Kit Básico do Investidor | OPções',
    },
    {
      'image': 'assets/images/empiricus.png',
      'title': 'Kit Básico do Investidor | Renda Fixa',
    },
    {
      'image': 'assets/images/empiricus.png',
      'title': 'Kit Básico do Investidor | Cripto',
    },
  ];

  List<ContentsModel> _toModels(List<Map<String, String>> source) {
    return source.map(ContentsModel.fromJson).toList();
  }

  Future<List<ContentsModel>> getListComplementaryContent() async {
    return _toModels(complementaryContentJson);
  }

  Future<List<ContentsModel>> getListBTGPactualContent() async {
    return _toModels(btgPactualContentJson);
  }

  Future<List<ContentsModel>> getListBasicInvestorKitContent() async {
    return _toModels(basicInvestorKitContentJson);
  }
}
