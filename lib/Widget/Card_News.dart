import 'package:flutter/material.dart';

class Card_News extends StatelessWidget {
  final String txt;
  final String date;
  final String img;

  const Card_News(
      {super.key, required this.txt, required this.date, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                  child: Image.asset(
                "Assets/img/student.png",
                width: 70,
              )),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    "أداره ألجامعه",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            endIndent: 10,
            indent: 10,
          ),
          Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: Text(
                txt,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
          img != null || img != ""
              ? Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  height: 300,
                  child: Expanded(child: Image.asset("Assets/img/1.jpg")),
                )
              : Container()
        ],
      ),
    );
  }
}
