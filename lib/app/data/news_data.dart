import 'package:clone_empiricus_research/app/models/news_model.dart';

class NewsData {
  final List<Map<String, String>> moneyTimesJson = [
    {
      'site_name': 'Money Times - 2 horas atrás',
      'description': 'Mega-Sena: Concurso de sábado fica sem vencedor e acumula; confira',
      'image_site': 'assets/images/money_times.png',
      'image_news': 'assets/images/news_money_times_1.png',
    },
    {
      'site_name': 'Money Times - 2 horas atrás',
      'description': 'Invest: Especial sobre fundos e estratégias para pequenos investidores',
      'image_site': 'assets/images/money_times.png',
      'image_news': 'assets/images/news_money_times_2.png',
    },
    {
      'site_name': 'Money Times - 3 horas atrás',
      'description': 'Empiricus: Análise da carteira recomendada e seus principais ativos',
      'image_site': 'assets/images/money_times.png',
      'image_news': 'assets/images/news_money_times_3.png',
    },
    {
      'site_name': 'Money Times - 3 horas atrás',
      'description': 'Entrevista com diretor: perspectivas de mercado e oportunidades para 2026',
      'image_site': 'assets/images/money_times.png',
      'image_news': 'assets/images/news_money_times_4.png',
    },
  ];

  final List<Map<String, String>> yourMoneyJson = [
   {
      'site_name': 'Seu Dinheiro - 5 horas atrás',
      'description': 'Guia prático de investimentos para começar com segurança',
      'image_site': 'assets/images/seu_dinheiro.png',
      'image_news': 'assets/images/news_seu_dinheiro_1.png',
    },
    {
      'site_name': 'Seu Dinheiro - 5 horas atrás',
      'description': 'Como montar uma carteira diversificada em passos práticos',
      'image_site': 'assets/images/seu_dinheiro.png',
      'image_news': 'assets/images/news_seu_dinheiro_2.png',
    },
    {
      'site_name': 'Seu Dinheiro - 6 horas atrás',
      'description': 'Resumo do evento 24/07 com dicas práticas para investidores',
      'image_site': 'assets/images/seu_dinheiro.png',
      'image_news': 'assets/images/news_seu_dinheiro_3.png',
    },
    {
      'site_name': 'Seu Dinheiro - 7 horas atrás',
      'description': 'Painel com especialistas debate cenários e estratégias de 2026',
      'image_site': 'assets/images/seu_dinheiro.png',
      'image_news': 'assets/images/news_seu_dinheiro_4.png',
    },
  ];

  final List<Map<String, String>> explainJson = [
    {
      'site_name': 'Explica - 1 mês atrás',
      'description': 'Conceitos essenciais de mercado explicados de forma simples e direta',
      'image_site': 'assets/images/empiricus_logo.png',
      'image_news': 'assets/images/explain_1.png',
    },
    {
      'site_name': 'Explica - 1 mês atrás',
      'description': 'Principais termos financeiros que todo investidor deve conhecer',
      'image_site': 'assets/images/empiricus_logo.png',
      'image_news': 'assets/images/explain_2.png',
    },
    {
      'site_name': 'Explica - 1 mês atrás',
      'description': 'Análise prática sobre decisões de carteira e gestão de risco',
      'image_site': 'assets/images/empiricus_logo.png',
      'image_news': 'assets/images/explain_3.png',
    },
    {
      'site_name': 'Explica - 1 mês atrás',
      'description': 'Entrevistas e explicações sobre estratégias para diferentes perfis',
      'image_site': 'assets/images/empiricus_logo.png',
      'image_news': 'assets/images/explain_4.png',
    },
  ];

  List<NewsModel> _toModels(List<Map<String, String>> source) {
    return source.map(NewsModel.fromJson).toList();
  }

  Future<List<NewsModel>> getListMoneyTimesNews() async {
    return _toModels(moneyTimesJson);
  }

  Future<List<NewsModel>> getListYourMoneyNews() async {
    return _toModels(yourMoneyJson);
  }

  Future<List<NewsModel>> getListExplain() async {
    return _toModels(explainJson);
  }
}
