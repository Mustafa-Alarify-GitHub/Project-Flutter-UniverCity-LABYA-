import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hine/Api/Api.dart';
import 'package:hine/Api/LinkApp.dart';

import '../Const/AppColors.dart';

class Cateogries_Controllers extends GetxController {
  bool lodding = true;
  List data = [];

  Get_All_data() async {
    lodding = true;
    data.clear();
    var response = await Api.getData("${Linkapp.Get_All_Cat}");
    print(response);
    if (response["status"] == 200) {
      data.addAll(response["data"]);
      lodding = false;
    } else {
      Get.dialog(Center(
        child: Container(
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.symmetric(horizontal: 30),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "قريبا",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Container(
                      color: AppColors.main_Colors,
                      padding: EdgeInsets.symmetric(vertical: 010),
                      child: Center(
                          child: Text(
                        "موأفق",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )))),
            ],
          ),
        ),
      ));
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    Get_All_data();
  }
}
