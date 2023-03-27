import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui_intern/themes/app_assets.dart';
import 'package:ui_intern/themes/app_colors.dart';
import 'package:ui_intern/themes/app_style.dart';

import 'components/build_context.dart';
import 'components/signup_and_exit.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();

  int currenPage = 0;

  int maxPage = 2;

  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: PageView(
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() {
                        currenPage = index;
                      });
                    },
                    children: const [
                      buildContext(
                        urlImage: AppAssets.ic_boarding1,
                        heading: "Chào mừng đến với My Smart Home",
                        body: "Ứng dụng quản lý nhà thông minh",
                      ),
                      buildContext(
                        urlImage: AppAssets.ic_boarding2,
                        heading: "Điều khiển dễ dàng",
                        body: "Điều khiển các thiết bị thông qua Internet",
                      ),
                      buildContext(
                        urlImage: AppAssets.ic_boarding3,
                        heading: "Kiểm soát nhà ở",
                        body: "Biết tình trạng các thiết bị mọi lúc mọi nơi",
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (index) => buildDot(index: index))),
                        const Spacer(),
                        currenPage == maxPage
                        ? SignUpAndExit(
                            signup: () {},
                            exit: () {},
                          )
                        : Container(),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildDot({int? index}) {
    return Container(
        height: 8,
        width: currenPage == index ? 32 : 16,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: currenPage == index ? AppColors.blue : AppColors.gray,
            borderRadius: BorderRadius.circular(10)));
  }
}
