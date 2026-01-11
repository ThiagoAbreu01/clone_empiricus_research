import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:clone_empiricus_research/app/core/ui/styles/theme/custom_theme_switcher.dart';
import 'package:clone_empiricus_research/app/core/ui/styles/theme/theme_data.dart';
import 'package:clone_empiricus_research/app/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsListTile extends StatefulWidget {
  final NewsModel newsModel;

  const NewsListTile({super.key, required this.newsModel});

  @override
  State<NewsListTile> createState() => _NewsListTileState();
}

class _NewsListTileState extends State<NewsListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 160,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text(
                        widget.newsModel.description,
                        style: TextStyle(
                          color: context.tertiaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // RichText(
                    //   text: TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: '13/01 \n',
                    //         style: TextStyle(
                    //           color: context.tertiaryColor,
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //       ),
                    //       TextSpan(
                    //         text: 'Às 15h00',
                    //         style: TextStyle(
                    //           color: context.tertiaryColor
                    //               .withValues(alpha: 0.6),
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Spacer(),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: Image.asset(
                            widget.newsModel.imageNews,
                          ).image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: Image.asset(
                      widget.newsModel.imageSite,
                    ).image,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.newsModel.siteName,
                    style: TextStyle(
                      color: context.tertiaryColor.withValues(alpha: 0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
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
