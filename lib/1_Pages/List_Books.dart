import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hine/2_Controllers/Books_Controller.dart';
import 'package:hine/Api/LinkApp.dart';
import 'package:hine/Const/AppColors.dart';
import 'package:hine/Widget/Card_one_book.dart';
import 'package:hine/Widget/Lodding.dart';
import 'package:url_launcher/url_launcher.dart';

class List_Books extends StatelessWidget {
  final String txt_Apper;
  final int id_cat;

  const List_Books({super.key, required this.txt_Apper, required this.id_cat});

  @override
  Widget build(BuildContext context) {
    Books_Controller controller = Get.put(Books_Controller());
    controller.Get_All_data(id_cat);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            color: AppColors.main_Colors,
            width: double.infinity,
            height: 80,
            child: Center(
              child: Text(
                "$txt_Apper",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Cairo",
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<Books_Controller>(
                builder: (cont) => cont.lodding
                    ? Lodding()
                    : controller.data.length > 0
                        ? ListView.builder(
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: ()async{
                                  await launchUrl("${Linkapp.Open_Books}/${controller.data[index]["id"]}" as Uri);
                                },
                                child: Card_one_book(
                                    name_book:
                                        "${controller.data[index]["name"]}",
                                    src: "${controller.data[index]["src_bdf"]}"),
                              );
                            })
                        : Center(
                            child: Text(
                            "لايوجد كتب حاليا في هاذا القسم !",
                            style:
                                TextStyle(fontSize: 25, color: Colors.black54),
                          ))),
          ),
        ],
      ),
    );
  }
}
