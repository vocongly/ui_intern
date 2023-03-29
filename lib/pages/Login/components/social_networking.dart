import 'package:flutter/material.dart';

import '../../../components/image_button.dart';
import '../../../themes/app_assets.dart';
import '../../../themes/app_style.dart';

class SocialNetworking extends StatelessWidget {
  const SocialNetworking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 32, bottom: 11),
          child: Center(
              child: Text(
            'Hoặc',
            style: AppStyles.body1,
          )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageButton(
              onClicked: () {},
              imagePath: AppAssets.ic_facebook_fill,
            ),
            const SizedBox(
              width: 30,
            ),
            ImageButton(
              onClicked: () {},
              imagePath: AppAssets.ic_google_fill,
            ),
            const SizedBox(
              width: 30,
            ),
            ImageButton(
              onClicked: () {},
              imagePath: AppAssets.ic_apple_fill,
            ),
          ],
        ),
      ],
    );
  }
}
