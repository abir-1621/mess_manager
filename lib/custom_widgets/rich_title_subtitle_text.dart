import 'package:flutter/material.dart';

class RichTitleSubtilteText extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color subtitleColor;

  const RichTitleSubtilteText(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.subtitleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$title",
        style: Theme.of(context).textTheme.caption,
        children: <TextSpan>[
          TextSpan(
            text: '$subtitle',
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: subtitleColor),
          ),
        ],
      ),
    );
  }
}
