import 'package:flutter/material.dart';

import 'input_code.dart';

class DigitCode extends StatelessWidget {
  const DigitCode({
    Key? key,
    required this.otpController1,
    required this.otpController2,
    required this.otpController3,
    required this.otpController4,
  }) : super(key: key);

  final TextEditingController otpController1;
  final TextEditingController otpController2;
  final TextEditingController otpController3;
  final TextEditingController otpController4;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputCode(
            otpController1: otpController1,
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }
              FocusScope.of(context).nextFocus();
            },
          ),
          InputCode(
            otpController1: otpController2,
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }
              FocusScope.of(context).nextFocus();
            },
          ),
          InputCode(
            otpController1: otpController3,
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }
              FocusScope.of(context).nextFocus();
            },
          ),
          InputCode(
            otpController1: otpController4,
            onChanged: (value) {
              if (value.isEmpty) {
                FocusScope.of(context).nextFocus();
                return;
              }
            },
          ),
        ],
      ),
    );
  }
}
