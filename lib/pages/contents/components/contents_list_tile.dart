import 'package:clone_empiricus_research/app/core/ui/extensions/size_screen_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/styles/theme/custom_theme_switcher.dart';
import 'package:clone_empiricus_research/app/core/ui/styles/theme/theme_data.dart';
import 'package:clone_empiricus_research/app/models/contents_model.dart';
import 'package:flutter/material.dart';

class ContentsListTile extends StatefulWidget {
  final ContentsModel contentsModel;
  const ContentsListTile({super.key, required this.contentsModel});

  @override
  State<ContentsListTile> createState() => _ContentsListTileState();
}

class _ContentsListTileState extends State<ContentsListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: context.width,
      color: context.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.contentsModel.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                SizedBox(
                  width: context.width * 0.65,
                  child: Text(
                    widget.contentsModel.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.tertiaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.chevron_right,
                  color: context.secondaryColor,
                  size: 35,
                ),
              ],
            ),
            Spacer(),
            Divider(
              height: 0.5,
              color: CustomThemeSwitcher.themeType == AppDarkTheme.data
              ? context.primaryColor.withValues(alpha: 1.8)
              : Colors.grey[300],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
