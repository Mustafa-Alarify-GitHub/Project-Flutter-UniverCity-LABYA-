import 'package:flutter/material.dart';
import 'package:hine/Const/AppColors.dart';

class Card_Btn extends StatelessWidget {
  final String txt;
  final String img;
  final String des;
  final void Function()? onPressed;

  const Card_Btn({super.key, required this.txt, required this.img, required this.des,  required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 0), blurRadius: 15)
          ]),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          children: [

            Image.asset(
              img,
              width: 75,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txt,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style:
                    TextStyle(fontSize: 22, color: AppColors.main_Colors),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    des,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 12, color: Colors.grey[500],fontFamily: "Cairo"),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.main_Colors,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
