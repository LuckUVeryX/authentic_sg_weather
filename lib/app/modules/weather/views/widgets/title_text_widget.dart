import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    Key? key,
    required this.highlight,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String highlight;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline2?.copyWith(
          fontWeight: FontWeight.bold,
        );
    List<String> titleSeparated = title.split('|');
    return RichText(
      text: TextSpan(
        style: textStyle,
        children: [
          for (String titleText in titleSeparated)
            titleText == highlight
                ? TextSpan(
                    text: '$titleText\n',
                    style: textStyle?.copyWith(
                      color: color,
                    ),
                  )
                : TextSpan(text: '$titleText\n'),
        ],
      ),
    );
  }
}
