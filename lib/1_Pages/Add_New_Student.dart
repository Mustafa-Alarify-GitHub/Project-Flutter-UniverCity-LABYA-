import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hine/2_Controllers/Add_New_Student_Controller.dart';
import 'package:hine/Const/AppColors.dart';
import 'package:hine/Widget/Text_Filed.dart';

class Add_New_Student extends StatefulWidget {
  @override
  State<Add_New_Student> createState() => _Add_New_StudentState();
}

class _Add_New_StudentState extends State<Add_New_Student> {
  Add_New_Student_Controller controller = Get.put(Add_New_Student_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ألتسجيل في الكليه",
          style:
              TextStyle(fontSize: 25, color: Colors.white, fontFamily: "Cairo"),
        ),
        backgroundColor: AppColors.main_Colors,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Text_Flied(
              controller_: controller.name_Student,
              keyboardType_: TextInputType.name,
              labelText: "الاسم الرباعي",
              helperText: "يرجى ان يكون الاسم كامل",
              maxLines: 1),
          GetBuilder<Add_New_Student_Controller>(
            builder: (con) => Container(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // RadioListTile(value: "ذكر", groupValue: selectedOption, onChanged: (val){
                    //   print(val);
                    // }),
                    Text(
                      "الجنس :",
                      style: TextStyle(
                          color: AppColors.main_Colors,
                          fontSize: 20,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () {
                        controller.genders = "ذكر";
                        controller.update();
                      },
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 1000),
                        width: 90,
                        height: 40,
                        color: controller.genders == "ذكر"
                            ? AppColors.main_Colors
                            : Colors.grey[200],
                        child: Center(
                          child: Text(
                            "ذكر",
                            style: TextStyle(
                              fontSize: 22,
                              color: controller.genders == "ذكر"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.genders = "انثئ";
                        controller.update();
                      },
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 1000),
                        width: 90,
                        height: 40,
                        color: controller.genders == "انثئ"
                            ? AppColors.main_Colors
                            : Colors.grey[200],
                        child: Center(
                          child: Text(
                            "انثئ",
                            style: TextStyle(
                              fontSize: 22,
                              color: controller.genders == "انثئ"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Text_Flied(
              controller_: controller.national_number,
              keyboardType_: TextInputType.number,
              labelText: "الرقم الوطني",
              helperText: "يرجى التحقق من الرقم جيدً",
              maxLines: 1),
          Text_Flied(
              controller_: controller.registration_number,
              keyboardType_: TextInputType.number,
              labelText: "رقم القيد",
              helperText: "يرجى التحقق من الرقم جيدً",
              maxLines: 1),
          Text_Flied(
              controller_: controller.identity_proof_number,
              keyboardType_: TextInputType.number,
              labelText: "رقم الإثبات الشخصي",
              helperText: "يرجى التحقق من الرقم جيدً",
              maxLines: 1),
          Text_Flied(
              controller_: controller.nationality,
              keyboardType_: TextInputType.name,
              labelText: "الجنسية ",
              helperText: "",
              maxLines: 1),
          Text_Flied(
              controller_: controller.loc_student,
              keyboardType_: TextInputType.name,
              labelText: "إقامة الطاب ",
              helperText: "المدينة و المنطقة",
              maxLines: 1),
          Text_Flied(
              controller_: controller.name_mather,
              keyboardType_: TextInputType.name,
              labelText: "اسم الام ",
              helperText: "على الاسم ان يكون ثلاثي",
              maxLines: 1),
          Text_Flied(
              controller_: controller.nationality_mather,
              keyboardType_: TextInputType.name,
              labelText: "جنسية الام ",
              helperText: "",
              maxLines: 1),
          Text_Flied(
              controller_: controller.number_phone,
              keyboardType_: TextInputType.number,
              labelText: "رقم هاتف ولي الامر ",
              helperText: "الرجاء إدخال رقم هاتف فعال",
              maxLines: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: Text(
              "فصيله الدم :",
              style: TextStyle(
                  color: AppColors.main_Colors,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          GetBuilder<Add_New_Student_Controller>(
            builder: (con) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                          controller.type_blood.length,
                          (index) => InkWell(
                                onTap: () {
                                  controller.blood =
                                      "${controller.type_blood[index]}";
                                  controller.update();
                                },
                                child: AnimatedContainer(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  duration: Duration(microseconds: 1000),
                                  width: 40,
                                  height: 40,
                                  color: controller.blood ==
                                          "${controller.type_blood[index]}"
                                      ? AppColors.main_Colors
                                      : Colors.grey[200],
                                  child: Center(
                                    child: Text(
                                      "${controller.type_blood[index]}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: controller.blood ==
                                                "${controller.type_blood[index]}"
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                    ],
                  ),
                )),
          ),
          Text_Flied(
              controller_: controller.type_certificate,
              keyboardType_: TextInputType.name,
              labelText: "نوع الشهادة",
              helperText: "",
              maxLines: 1),
          GetBuilder<Add_New_Student_Controller>(
            builder: (con) => Container(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // RadioListTile(value: "ذكر", groupValue: selectedOption, onChanged: (val){
                    //   print(val);
                    // }),
                    Text(
                      "ألقسم :",
                      style: TextStyle(
                          color: AppColors.main_Colors,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () {
                        controller.type_part = "أدبي";
                        controller.update();
                      },
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 1000),
                        width: 90,
                        height: 40,
                        color: controller.type_part == "أدبي"
                            ? AppColors.main_Colors
                            : Colors.grey[200],
                        child: Center(
                          child: Text(
                            "أدبي",
                            style: TextStyle(
                              fontSize: 22,
                              color: controller.type_part == "أدبي"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.type_part = "علمي";
                        controller.update();
                      },
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 1000),
                        width: 90,
                        height: 40,
                        color: controller.type_part == "علمي"
                            ? AppColors.main_Colors
                            : Colors.grey[200],
                        child: Center(
                          child: Text(
                            "علمي",
                            style: TextStyle(
                              fontSize: 22,
                              color: controller.type_part == "علمي"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Text_Flied(
              onChanged: (value) {
                if (double.parse("${value}") > 100) {
                  controller.rate_certificate.text = "100";
                  // setState(() {});
                }
                print(value);
              },
              controller_: controller.rate_certificate,
              keyboardType_: TextInputType.number,
              labelText: "نسبة الشهادة",
              helperText: "",
              maxLines: 1),
          GetBuilder<Add_New_Student_Controller>(
            builder: (con) => Container(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "صفه القيد :",
                      style: TextStyle(
                          color: AppColors.main_Colors,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () {
                        controller.type_RR = "نظامي";
                        controller.update();
                      },
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 1000),
                        width: 90,
                        height: 40,
                        color: controller.type_RR == "نظامي"
                            ? AppColors.main_Colors
                            : Colors.grey[200],
                        child: Center(
                          child: Text(
                            "نظامي",
                            style: TextStyle(
                              fontSize: 22,
                              color: controller.type_RR == "نظامي"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.type_RR = "انتساب";
                        controller.update();
                      },
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 1000),
                        width: 90,
                        height: 40,
                        color: controller.type_RR == "انتساب"
                            ? AppColors.main_Colors
                            : Colors.grey[200],
                        child: Center(
                          child: Text(
                            "انتساب",
                            style: TextStyle(
                              fontSize: 22,
                              color: controller.type_RR == "انتساب"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: GetBuilder<Add_New_Student_Controller>(
            builder: (con) => GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
              children: [
                controller.image != null
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.file(controller.image!),
                          Positioned(
                              bottom: 0,
                              right: 10,
                              child: IconButton(
                                  onPressed: () {
                                    controller.image = null;
                                    controller.update();
                                  },
                                  tooltip: "ازاله الصوره",
                                  icon: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.red,
                                  )))
                        ],
                      )
                    : InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              title: "صوره شهاده ألثنويه",
                              backgroundColor: Colors.white,
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.getImageCa(false);
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.camera_alt,
                                          size: 50,
                                          color: AppColors.main_Colors,
                                        ),
                                        Text(
                                          "ألكاميره",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.getImage(false);
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.image,
                                          size: 50,
                                          color: AppColors.main_Colors,
                                        ),
                                        Text(
                                          "ألاستديوه",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                        child: Container(
                          color: Colors.grey[400],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "صوره شهاده ",
                                style: TextStyle(
                                    fontSize: 20, fontFamily: "Cairo"),
                              ),
                              Text(
                                " ألثنويه ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Cairo",
                                    color: AppColors.main_Colors),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(Icons.add, size: 60)
                            ],
                          ),
                        ),
                      ),
                controller.image_party != null
                    ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.file(controller.image_party!),
                    Positioned(
                        bottom: 0,
                        right: 10,
                        child: IconButton(
                            onPressed: () {
                              controller.image_party = null;
                              controller.update();
                            },
                            tooltip: "ازاله الصوره",
                            icon: Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.red,
                            )))
                  ],
                )
                    : InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              title: "صوره شهاده الميلاد",
                              backgroundColor: Colors.white,
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.getImageCa(true);
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.camera_alt,
                                          size: 50,
                                          color: AppColors.main_Colors,
                                        ),
                                        Text(
                                          "ألكاميره",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.getImage(true);
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.image,
                                          size: 50,
                                          color: AppColors.main_Colors,
                                        ),
                                        Text(
                                          "ألاستديوه",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                        child: Container(
                          color: Colors.grey[400],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "صوره شهاده ",
                                style: TextStyle(
                                    fontSize: 20, fontFamily: "Cairo"),
                              ),
                              Text(
                                " ألميلاد ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Cairo",
                                    color: AppColors.main_Colors),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(Icons.add, size: 60)
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          )),
          InkWell(
            onTap: () {
              controller.Send_Data();
            },
            child: Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.main_Colors,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "أرسال الطلب",
                  style: TextStyle(
                      fontFamily: "Cairo", fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
