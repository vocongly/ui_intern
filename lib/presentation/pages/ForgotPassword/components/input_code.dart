import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../ulti/style/app_colors.dart';

class InputCode extends StatelessWidget {
  const InputCode({
    Key? key,
    required this.otpController1,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController otpController1;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.lightGray,
      ),
      alignment: Alignment.center,
      child: TextFormField(
          controller: otpController1,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.headlineMedium,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.blue, width: 1.0),
              borderRadius: BorderRadius.circular(16)
            ),
            labelStyle: const TextStyle(fontSize: 16),
            contentPadding: const EdgeInsets.all(0),
            border: InputBorder.none),
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: onChanged),
    );
  }
}
