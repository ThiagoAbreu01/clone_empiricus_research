import 'package:clone_empiricus_research/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
        backgroundColor: context.tertiaryContainer,
           body: Container(),
       );
  }
}