import 'package:flutter/material.dart';

import '../Const/AppColors.dart';

class CardBooks extends StatelessWidget {
  final String title;

  const CardBooks({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 5, offset: Offset(0, 0))
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          width: 8,
          height: 80,
          decoration: BoxDecoration(
              color: AppColors.main_Colors,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        Expanded(
            child: Container(
                child: Center(
                    child: Text(
          title,
          style: TextStyle(
              fontSize: 25, color: AppColors.main_Colors, fontFamily: "Cairo"),
        )))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward,
            color: AppColors.main_Colors,
          ),
        ),
      ]),
    );
  }
}
