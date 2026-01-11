import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/styles/theme/custom_theme_switcher.dart';
import 'package:clone_empiricus_research/app/core/ui/styles/theme/theme_data.dart';
import 'package:clone_empiricus_research/app/models/lives_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NextLivesListTile extends StatefulWidget {
  final LivesModel livesModel;

  const NextLivesListTile({super.key, required this.livesModel});

  @override
  State<NextLivesListTile> createState() => _NextLivesListTileState();
}

class _NextLivesListTileState extends State<NextLivesListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: CustomThemeSwitcher.themeType == AppDarkTheme.data
              ? context.primaryColor.withValues(alpha: 1.8)
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${DateFormat('dd/MM').format(widget.livesModel.date)}\n',
                          style: TextStyle(
                            color: context.tertiaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Às ${DateFormat('HH:mm').format(widget.livesModel.date)}',
                          style: TextStyle(
                            color: context.tertiaryColor.withValues(alpha: 0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Material(
                    color: context.secondaryColor,
                    borderRadius: BorderRadius.circular(4),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(4),
                      child: SizedBox(
                        height: 40,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock_open,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Liberar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                widget.livesModel.description,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: context.tertiaryColor,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: Image.asset(widget.livesModel.image).image,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.livesModel.title,
                      style: TextStyle(
                        color: context.tertiaryColor.withValues(alpha: 0.8),
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
