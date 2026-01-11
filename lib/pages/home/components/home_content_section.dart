import 'package:clone_empiricus_research/app/core/ui/extensions/size_screen_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:clone_empiricus_research/pages/home/components/lives/next_lives.dart';
import 'package:clone_empiricus_research/pages/home/components/news/explain/explain.dart';
import 'package:clone_empiricus_research/pages/home/components/news/money_times/money_times.dart';
import 'package:clone_empiricus_research/pages/home/components/news/your_money/your_money.dart';
import 'package:clone_empiricus_research/pages/home/home_controller.dart';
import 'package:clone_empiricus_research/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContentSection extends StatelessWidget {
  final int pageIndex;

  const HomeContentSection({super.key, this.pageIndex = 0});

  @override
  Widget build(BuildContext context) {
    if (pageIndex == 0) {
      return SizedBox.shrink();
    }

    return BlocBuilder<HomeController, HomeState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: context.width,
              color: context.primaryColor,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(
                      Icons.menu,
                      color: context.tertiaryColor,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Seções',
                    style: TextStyle(
                      color: context.tertiaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    color: context.secondaryColor,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            NextLives(listLives: state.listLives),
            const SizedBox(height: 10),
            MoneyTimes(moneyTimesNews: state.listMoneyTimesNews),
            const SizedBox(height: 10),
            YourMoney(yourMoneyNews: state.listYourMoneyNews),
            const SizedBox(height: 10),
            Explain(explainNews: state.listExplain),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
