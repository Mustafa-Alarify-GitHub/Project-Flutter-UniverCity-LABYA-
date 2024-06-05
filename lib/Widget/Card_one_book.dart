import 'package:flutter/material.dart';
import 'package:hine/Api/LinkApp.dart';
import 'package:hine/Const/AppColors.dart';
import 'package:url_launcher/url_launcher.dart';

class Card_one_book extends StatelessWidget {
  final String name_book;
  final String src;

  const Card_one_book({super.key, required this.name_book, required this.src});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        print("${Linkapp.Open_Books}/${src}");
        await launchUrl( Uri.parse("${Linkapp.Open_Books}/${src}"));
      },
      child: Container(
        height: 90,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black54, blurRadius: 5, offset: Offset(0, 0))
        ]),
        child: Row(
          children: [
            Icon(
              Icons.book_rounded,
              size: 70,
              color: AppColors.main_Colors,
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.black38,
            ),
            Expanded(
                child: Center(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$name_book',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'أضغط لتنزيل الكتاب',
                  style: const TextStyle(
                    decorationColor: Colors.red,
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    color: Colors.red,
                  ),
                ),
              ],
            ))),
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
