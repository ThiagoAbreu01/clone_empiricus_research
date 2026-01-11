import 'package:clone_empiricus_research/app/core/ui/extensions/size_screen_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:clone_empiricus_research/app/models/lives_model.dart';
import 'package:clone_empiricus_research/pages/home/components/lives/next_lives_list_view.dart';
import 'package:flutter/material.dart';

class NextLives extends StatefulWidget {
  final List<LivesModel> listLives;
  const NextLives({super.key, required this.listLives});

  @override
  State<NextLives> createState() => _NextLivesState();
}

class _NextLivesState extends State<NextLives> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: context.width,
      color: context.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Text(
              'Próximas lives',
              style: TextStyle(
                color: context.tertiaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            NextLivesListView(
              listLives: widget.listLives,
            ),
          ],
        ),
      ),
    );
  }
}
