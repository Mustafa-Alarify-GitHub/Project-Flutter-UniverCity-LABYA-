import 'package:get/get.dart';
import 'package:hine/Api/Api.dart';
import 'package:hine/Api/LinkApp.dart';
import 'package:hine/SherdRefrance/shared_preferences.dart';

class Status_Register_Controller extends GetxController {
  bool lodding = true;
  String data = "مرفوض";

  Get_status() async {
    lodding = true;
    var id = await shared.getData(shared.key_ID);

    var respones = await Api.getData("${Linkapp.Get_Status_Register}/$id");
    data = "${respones["data"]["status_regster"]}";
    print(respones);
    lodding = false;

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    Get_status();
  }
}
