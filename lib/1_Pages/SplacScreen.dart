import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hine/1_Pages/Home.dart';
import 'package:hine/Const/AppColors.dart';
 import 'package:lottie/lottie.dart';

class Splach extends StatefulWidget {
  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {

  void Wait()async {
    await Future.delayed(Duration(milliseconds: 3500));
    Get.off(()=>Home(),transition: Transition.size);

  }

  @override
  void initState() {
    // TODO: implement initState
    Wait();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            "مرحبا بك في كليه",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              // fontFamily: "Cairo",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "أصوال الدين",
            style: TextStyle(
                fontSize: 65,
                fontFamily: "Cairo"
                ,
                color: AppColors.main_Colors),
          ),
          Container(
              child: Lottie.asset('Assets/lottie/opener-loading.json')),
          Text(
            "جامعه السيد محمد بن علي السنوسي الأسلاميه",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo",
            ),
          ),
          Spacer(),
          const Text(
            " الاصدار 1.0.0",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
