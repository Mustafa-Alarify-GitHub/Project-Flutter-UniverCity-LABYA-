import 'package:flutter/material.dart';
import 'package:hine/Const/AppColors.dart';

class Library extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main_Colors,
        centerTitle: true,
        title: const Text(
          "أقسام الكليه",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, fontFamily: "Cairo"),
        ),
        elevation: 10,
      ),
      body: ListView(),
    );
  }
}
