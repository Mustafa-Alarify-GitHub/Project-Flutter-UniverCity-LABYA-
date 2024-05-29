import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hine/1_Pages/Home.dart';
import 'package:hine/2_Controllers/Status_Register_Controller.dart';
import 'package:hine/Widget/Lodding.dart';

class Status_Register extends StatelessWidget {
  @override
  Status_Register_Controller controller = Get.put(Status_Register_Controller());

  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: ()async{
            // controller.Get_status();

          },
          child:  GetBuilder<Status_Register_Controller>(
                  builder: (con) => controller.lodding
              ? Lodding()
              : controller.data == "مقبول"
                  ? Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "مبروك",
                            style: TextStyle(
                              fontSize: 50,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                border: Border.all(color: Colors.green, width: 10)),
                            child: Center(
                              child: Text(
                                " تم قبولك",
                                style: TextStyle(fontSize: 50, color: Colors.green),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text("يجب عليك التوجه الي الجامعه لاكمال عمليه التسجيل"),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "Assets/img/p2.png",
                                  width: 200,
                                ),
                                Image.asset(
                                  "Assets/img/p.png",
                                  width: 200,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : controller.data == "مرفوض"? Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "لقد تم رفض طلبك",
                            style: TextStyle(
                              fontSize: 50,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                border: Border.all(color: Colors.red, width: 10)),
                            child: Center(
                              child: Text(
                                " تم الرفض",
                                style: TextStyle(fontSize: 50, color: Colors.red),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text("يمكنك ارسال طلب مره اخره غدا",style: TextStyle(color: Colors.grey[600],fontSize: 18),),

                          InkWell(
                            onTap: (){
                             Get.offAll(()=>Home());
                            },
                            child: Container(
                              margin: EdgeInsets.all(25),
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text("ألعوده الي الصفحه ألرئيسيه",style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontSize: 20,color: Colors.white),),),
                            ),
                          )

                        ],
                      ),
                    ):Text("wait")
                ),
        ));
  }
}
