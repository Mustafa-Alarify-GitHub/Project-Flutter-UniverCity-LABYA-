import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hine/2_Controllers/Home_Controllers.dart';
import 'package:hine/2_Controllers/News_Controller.dart';
import 'package:hine/Widget/Card_Btn.dart';
import 'package:hine/Const/AppColors.dart';
import 'package:hine/Widget/Card_News.dart';
import 'package:hine/Widget/Drawer.dart';
import 'package:hine/Widget/Lodding.dart';

class Home extends StatelessWidget {
  Home_Controllers _home_controllers = Get.put(Home_Controllers());
  News_Controller _news_Controller = Get.put(News_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.main_Colors,
          centerTitle: true,
          title: const Text(
            "كليه أصوال الدين",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: "Cairo"),
          ),
          elevation: 10,
        ),
        drawer: MyDrawor(),
        backgroundColor: Colors.white,
        body: GetBuilder<Home_Controllers>(
            builder: (cont) => Column(
                  children: [
                    _home_controllers.inde_activ_page == 0
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: _home_controllers.data_btn.length,
                                itemBuilder: (context, index) {
                                  return Card_Btn(
                                    txt: _home_controllers.data_btn[index]
                                        ["title"],
                                    des: _home_controllers.data_btn[index]
                                        ["des"],
                                    img: _home_controllers.data_btn[index]
                                        ["img"],
                                    onPressed: _home_controllers.data_btn[index]
                                        ["page"],
                                  );
                                }),
                          )
                        : Expanded(
                            child: _news_Controller.lodding
                                ? Lodding()
                                : Container(
                                    width: double.infinity,
                                    color: Colors.black38,
                                    child: ListView.builder(
                                      itemCount: _news_Controller.data.length,
                                        itemBuilder: (context, index) {
                                      return Card_News(
                                          txt: "${_news_Controller.data[index]["body"]}",
                                          date: "${_news_Controller.data[index]["created_at"]}",
                                          img: "${_news_Controller.data[index]["img"]}"
                                      );
                                    }),
                                  ),
                          ),
                    Container(
                      width: double.infinity,
                      height: 65,
                      color: Colors.grey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              _home_controllers.inde_activ_page = 1;
                              _home_controllers.update();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.home_work_outlined,
                                  size: _home_controllers.inde_activ_page == 1
                                      ? 40
                                      : 30,
                                  color: _home_controllers.inde_activ_page == 1
                                      ? AppColors.main_Colors
                                      : Colors.black,
                                ),
                                Text(
                                  "ألاخبار",
                                  style: TextStyle(
                                    fontFamily: "Cairo",
                                    fontWeight:
                                        _home_controllers.inde_activ_page == 1
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                    color:
                                        _home_controllers.inde_activ_page == 1
                                            ? AppColors.main_Colors
                                            : Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _home_controllers.inde_activ_page = 0;
                              _home_controllers.update();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.home_outlined,
                                  size: _home_controllers.inde_activ_page == 0
                                      ? 40
                                      : 30,
                                  color: _home_controllers.inde_activ_page == 0
                                      ? AppColors.main_Colors
                                      : Colors.black,
                                ),
                                Text(
                                  "ألرئيسيه",
                                  style: TextStyle(
                                    fontFamily: "Cairo",
                                    fontWeight:
                                        _home_controllers.inde_activ_page == 0
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                    color:
                                        _home_controllers.inde_activ_page == 0
                                            ? AppColors.main_Colors
                                            : Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )));
  }
}
