import 'package:flutter/material.dart';
import 'package:hine/Const/AppColors.dart';

class MyDrawor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(color: AppColors.main_Colors,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50))),
            child: const Center(
                child: Text(
              "كليه أصوال الدين",
              style: TextStyle(fontSize: 30, color: Colors.white,fontFamily: "Cairo"),
            )),
          ),
        ],
      ),
    );
  }
}
