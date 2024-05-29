import 'package:flutter/material.dart';
import 'package:hine/Const/AppColors.dart';

class Card_Cateogry extends StatelessWidget {
  final String title;
  final String number;

  const Card_Cateogry({super.key, required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black38, blurRadius: 20, offset: Offset(0, 0))
          ],
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          width: 70,
          height: 80,
          decoration: BoxDecoration(
              color: AppColors.main_Colors,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
            child: Container(
                child: Center(
                    child: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        )))),
      ]),
    );
  }
}
