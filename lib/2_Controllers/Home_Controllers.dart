
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hine/1_Pages/Add_New_Student.dart';
import 'package:hine/1_Pages/Books.dart';
import 'package:hine/1_Pages/Cateogries.dart';
import 'package:hine/1_Pages/Status_Register.dart';
import 'package:hine/Api/Api.dart';
import 'package:hine/Api/LinkApp.dart';
import 'package:hine/Const/AppColors.dart';
import 'package:hine/SherdRefrance/shared_preferences.dart';

class Home_Controllers extends GetxController {
  int inde_activ_page = 0;
  List data_btn = [
    {
      "title": "(Online)ألتسجيل في الكليه",
      "des": "أختر تخصص وأكتب بياناتك بشكل صحيح ",
      "img": "Assets/img/univer.png",
      "page": () async {
        var respones = await Api.getData(Linkapp.Get_Register);
        print(respones["data"]["isOpenRegister"]);
        if (respones["data"]["isOpenRegister"] == 1) {
          var status = await shared.getData(shared.key_Status);
          var z = await shared.getData(shared.key_data);
          var data = DateTime.now();
          int day = data.day;

          if ("${day}" != "$z") {
            // shared.setData(shared.key_Status, "");
          }

          if (status == "wait") {
            print("11111111111111111111111111111");
            Get.to(() => Status_Register(), transition: Transition.size);
          } else {
            print("0000000000000000000000000000");

            Get.to(() => Add_New_Student(), transition: Transition.size);
          }

        } else {
          Get.dialog(Center(
            child: Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "عذر التسجيل مغلق حاليآ !",
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
                        shared.Clear_Cash();
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
      }
    },
    {
      "title": "أقسام الكليه",
      "des": "تحتوي علئ جميع اقسام المتاحه في الكليه",
      "img": "Assets/img/cateogr.png", // "page":(){Get.to()},
      "page": () {
        Get.to(() => Cateogries(), transition: Transition.size);
      },
    },
    {
      "title": "مكتبتي",
      "des": "تحتوي علئ جميع كتب الكليه",
      "img": "Assets/img/book.png", // "page":(){Get.to()},
      "page": () {
        Get.to(() => Books(), transition: Transition.size);
      },
    },
    {
      "title": "النتائج",
      "des": "استعلام عن درجات الطلاب ( قريبا)",
      "img": "Assets/img/student.png", // "page":(){Get.to()},
      "page": () {
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
      },
    },
  ];


}
