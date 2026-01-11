import 'package:clone_empiricus_research/app/core/ui/extensions/size_screen_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:clone_empiricus_research/app/models/news_model.dart';
import 'package:clone_empiricus_research/pages/home/components/news/your_money/your_money_list_view.dart';
import 'package:clone_empiricus_research/pages/home/home_controller.dart';
import 'package:clone_empiricus_research/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YourMoney extends StatefulWidget {
  final List<NewsModel> yourMoneyNews;
  const YourMoney({
    super.key,
    required this.yourMoneyNews,
  });

  @override
  State<YourMoney> createState() => _YourMoneyState();
}

class _YourMoneyState extends State<YourMoney> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeController, HomeState>(
      builder: (context, state) {
        return Container(
          height: 250,
          width: context.width,
          color: context.primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seu Dinheiro',
                      style: TextStyle(
                        color: context.tertiaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Ver Mais',
                      style: TextStyle(
                        color: context.secondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                YourMoneyListView(listNews: widget.yourMoneyNews)
              ],
            ),
          ),
        );
      },
    );
  }
}
