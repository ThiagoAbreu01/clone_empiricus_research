import 'package:clone_empiricus_research/app/core/ui/extensions/size_screen_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
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
      height: 100,
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
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  widget.contentsModel.title,
                  style: TextStyle(
                      color: context.tertiaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
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
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
