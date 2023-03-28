import 'package:flutter/material.dart';

import 'textform_email.dart';
import '../../../components/title_star.dart';

class EmailForm extends StatelessWidget {
  EmailForm({
    Key? key,
    required this.emailController, required this.isCorretEmail,this.iconUrl
  }) : super(key: key);

  final TextEditingController emailController;
  final bool isCorretEmail;

  String? iconUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleStar(
          title: "Email",
        ),
        TextFormEmail(iconUrl: iconUrl,emailController: emailController, isCorretEmail: isCorretEmail,),
      ],
    );
  }
}