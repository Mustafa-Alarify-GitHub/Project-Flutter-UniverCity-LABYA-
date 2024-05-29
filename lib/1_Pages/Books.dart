import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hine/1_Pages/List_Books.dart';
import 'package:hine/2_Controllers/Cateogries_Controllers.dart';
import 'package:hine/Const/AppColors.dart';
import 'package:hine/Widget/Card_List_Books.dart';
import 'package:hine/Widget/Card_Cateogry.dart';
import 'package:hine/Widget/Lodding.dart';

class Books extends StatelessWidget {
  Cateogries_Controllers _cateogries_controllers =
      Get.put(Cateogries_Controllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.main_Colors,
          centerTitle: true,
          title: const Text(
            "ألمكتبه",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                fontFamily: "Cairo",
                color: Colors.white),
          ),
          elevation: 10,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await _cateogries_controllers.Get_All_data();
          },
          child: GetBuilder<Cateogries_Controllers>(
              builder: (cont) => cont.lodding
                  ? Lodding()
                  : _cateogries_controllers.data.length > 0
                      ? ListView.builder(
                          itemCount: _cateogries_controllers.data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                    () => List_Books(
                                        txt_Apper:
                                            "${_cateogries_controllers.data[index]["name"]}",
                                        id_cat: _cateogries_controllers
                                            .data[index]["id"]),
                                    transition: Transition.size);
                              },
                              child: CardBooks(
                                title: _cateogries_controllers.data[index]
                                    ["name"],
                              ),
                            );
                          })
                      : Center(
                          child: Text(
                          "لايوجد أقسام حاليا",
                          style: TextStyle(fontSize: 30, color: Colors.black54),
                        ))),
        ));
  }
}
