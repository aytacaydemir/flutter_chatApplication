import 'package:app_firebase/constants/colors.dart';
import 'package:app_firebase/constants/texts.dart';
import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.primaryPage,
      appBar: AppBar(
        title: const Text(
          ProjectTexts.about,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: ColorsTheme.primaryAppBar,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              ProjectTexts.aboutAppHead,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              ProjectTexts.aboutAppExp,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              ProjectTexts.toolUsedHead,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              ProjectTexts.toolUsedExp,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              ProjectTexts.toDoHead,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              ProjectTexts.toDoExp,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            height: 30,
          ),
          const Text(ProjectTexts.author),
        ],
      ),
    );
  }
}
