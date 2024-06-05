import 'package:get/get.dart';
import 'package:hine/Api/Api.dart';
import 'package:hine/Api/LinkApp.dart';

class News_Controller extends GetxController {
  bool lodding = true;

  List data = [];

  Get_data() async {
    lodding = true;
    var respones = await Api.getData(Linkapp.Get_All_news);

    print(respones["data"]);
    data.addAll(respones["data"]);
    lodding = false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    Get_data();
  }
}
