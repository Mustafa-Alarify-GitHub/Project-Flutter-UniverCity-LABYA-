import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hine/1_Pages/Status_Register.dart';
import 'package:hine/Api/Api.dart';
import 'package:hine/Api/LinkApp.dart';
import 'package:hine/SherdRefrance/shared_preferences.dart';

class Add_New_Student_Controller extends GetxController {
  TextEditingController name_Student = TextEditingController();
  TextEditingController national_number = TextEditingController();
  TextEditingController registration_number = TextEditingController();
  TextEditingController identity_proof_number = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController loc_student = TextEditingController();
  TextEditingController name_mather = TextEditingController();
  TextEditingController nationality_mather = TextEditingController();
  TextEditingController number_phone = TextEditingController();
  TextEditingController type_certificate = TextEditingController();
  TextEditingController rate_certificate = TextEditingController();

  String genders = "";
  String type_part = ""; // أدبي علمي
  String type_RR = ""; // نظامي انتساب
  String blood = "";

  List type_blood = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];

  final picker = ImagePicker();
  File? image;
  File? image_party;

  Future getImage(bool isParty) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (isParty) {
        image_party = File(pickedFile.path);
        print(image_party);
      } else {
        image = File(pickedFile.path);
        print(image);
      }
    } else {
      print('No image selected.');
    }
    update();
    Get.back();
  }

  Future getImageCa(isParty) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      if (isParty) {
        image_party = File(pickedFile.path);
      } else {
        image = File(pickedFile.path);
      }
    } else {
      print('No image selected.');
    }
    update();
    Get.back();
  }

  Send_Data() async {
    if (name_Student.text != "" &&
        national_number.text != "" &&
        registration_number.text != "" &&
        identity_proof_number.text != "" &&
        nationality.text != "" &&
        loc_student.text != "" &&
        name_mather.text != "" &&
        nationality_mather.text != "" &&
        number_phone.text != "" &&
        type_certificate.text != "" &&
        rate_certificate.text != "" &&
        genders != "" &&
        type_part != "" &&
        type_RR != "" &&
        blood != "") {
      if (image != null && image_party != null) {
        var respones = await Api.postFiles("${Linkapp.Regster_Student}", {
          "img_hith_level": image_party!,
          "img_birth": image!
        }, {
          "name": name_Student.text,
          "number_GOV": national_number.text,
          "number_Rigstration": registration_number.text,
          "number_ID": identity_proof_number.text,
          "genders": genders,
          "nationality": nationality.text,
          "address": loc_student.text,
          "name_mather": name_mather.text,
          "nationality_mather": nationality_mather.text,
          "type_s": type_certificate.text,
          "rate": rate_certificate.text,
          "number_phone": number_phone.text,
          "type_blood": blood,
          "type_hith_level": type_part,
          "type_RR": type_RR,
        });


        // var respones = await Api.postData("${Linkapp.Regster_Student}", {
        //   "name": name_Student.text,
        //   "number_GOV": national_number.text,
        //   "number_Rigstration": registration_number.text,
        //   "number_ID": identity_proof_number.text,
        //   "genders": genders,
        //   "nationality": nationality.text,
        //   "address": loc_student.text,
        //   "name_mather": name_mather.text,
        //   "nationality_mather": nationality_mather.text,
        //   "img_birth": image_party,
        //   "img_hith_level": image,
        //   "type_s": type_certificate.text,
        //   "rate": rate_certificate.text,
        //   "number_phone": number_phone.text,
        //   "type_blood": blood,
        //   "type_hith_level": type_part,
        //   "type_RR": type_RR,
        // });
print(respones);
        if (respones["status"] == 400) {
          Get.snackbar("تنبيه", "${respones["massge"]}",
              colorText: Colors.white,
              backgroundColor: Color.fromARGB(255, 200, 51, 71));
        } else if (respones["status"] == 200) {
          shared.setData(shared.key_ID, "${respones["data"]["id"]}");
          shared.setData(shared.key_Status, "wait");
          shared.setData(shared.key_data, "${respones["data"]["created_at"]}");
          Get.off(() => Status_Register());
        }
      } else {
        Get.snackbar("تنبيه", "يجب ادخال ألصور بشكل صحيح ",
            colorText: Colors.white,
            backgroundColor: Color.fromARGB(255, 200, 51, 71));
      }
    } else {
      Get.snackbar("تنبيه", "يجب ادخال جميع البيانات بشكل صحيح ",
          colorText: Colors.white,
          backgroundColor: Color.fromARGB(255, 200, 51, 71));
    }
  }
}
