import 'package:flutter/material.dart';
import 'package:hine/Const/AppColors.dart';

class Text_Flied extends StatelessWidget {
  final TextEditingController controller_;
  final TextInputType keyboardType_;
  final String labelText;
  final String helperText;
  final int maxLines;

  // final int maxLength;
  final void Function(String)? onChanged;

  const Text_Flied(
      {super.key,
      required this.controller_,
      required this.keyboardType_,
      required this.labelText,
      required this.helperText,
      required this.maxLines,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    Color co1 = AppColors.main_Colors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
      child: TextField(
          onChanged: onChanged,
          controller: controller_,
          textAlign: TextAlign.center,
          maxLines: maxLines,
          keyboardType: keyboardType_,
          decoration: InputDecoration(
              helperText: helperText,
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(labelText),
              ),
              labelStyle: TextStyle(
                  color: co1,
                  fontSize: 20,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w700),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50), gapPadding: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50), gapPadding: 10))),
    );
  }
}
