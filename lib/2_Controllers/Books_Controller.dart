import 'package:get/get.dart';

import '../Api/Api.dart';
import '../Api/LinkApp.dart';

class Books_Controller extends GetxController {
  bool lodding = true;
  List data = [];

  Get_All_data(id_cat) async {
    print(id_cat);
    print(id_cat);
    print(id_cat);
    print(id_cat);
    lodding = true;
    data.clear();
    var response = await Api.getData("${Linkapp.Get_One_Books}/${id_cat}");
    print(response);
    if (response["status"] == 200) {
      data.addAll(response["data"]);
      lodding = false;
    } else {}

    update();
  }
}
