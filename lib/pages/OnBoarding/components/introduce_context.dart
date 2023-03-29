import 'package:flutter/material.dart';
import '../../../themes/app_style.dart';

class IntroduceContext extends StatelessWidget {
  const IntroduceContext({
    Key? key,
    required this.urlImage,
    required this.heading,
    required this.body,
  }) : super(key: key);

  final String urlImage;
  final String heading;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(urlImage),
        const SizedBox(
          height: 48,
        ),
        Text(
          heading,
          style: AppStyles.heading3,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          body,
          style: AppStyles.body1,
          textAlign: TextAlign.center,
        ),
        
      ],
    );
  }
}
