import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Api {
  // Get Date
  static getData(String url) async {
    try {
      var respones = await http.get(Uri.parse(url));

      if (respones.statusCode == 200) {
        var responsBody = jsonDecode(respones.body);
        return responsBody;
      } else {
        print("Error  ${respones.statusCode}");
      }
    } catch (e) {
      print("Error == ${e}");
    }
  }

  // Post  Date
  static postData(String url, Map Date) async {
    try {
      var respones = await http.post(Uri.parse(url), body: Date);

      if (respones.statusCode == 200) {
        var responsBody = jsonDecode(respones.body);
        return responsBody;
      } else {
        print("Error  ${respones.statusCode}");
      }
    } catch (e) {
      print("Error ===== ${e}");
    }
  }

  // static postFiles(String url,File file, Map Date, ) async {
  //
  //   var request = http.MultipartRequest("POST", Uri.parse(url));
  //
  //   var length = await file.length();
  //   var stream = http.ByteStream(file.openRead());
  //
  //   var muitparFile =
  //   http.MultipartFile("img_hith_level", stream, length, filename: file.path);
  //   request.files.add(muitparFile);
  //
  //   Date.forEach((key, value) {
  //     request.fields[key] = value;
  //   });
  //
  //   var send_Requst = await request.send();
  //   final response = await http.Response.fromStream(send_Requst);
  //
  //   if (send_Requst.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     print("Error == ${send_Requst.statusCode}");
  //   }
  // }
  static postFiles(
    String url,
    Map<String, File> Files,
    Map Date,
  ) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));

    Files.forEach((key, value) async {
      var length = await value.length();
      var stream = http.ByteStream(value.openRead());

      var muitparFile =
          http.MultipartFile(key, stream, length, filename: value.path);
      request.files.add(muitparFile);
    });

    Date.forEach((key, value) {
      request.fields[key] = value;
    });

    var send_Requst = await request.send();
    final response = await http.Response.fromStream(send_Requst);

    if (send_Requst.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Error == ${send_Requst.statusCode}");
    }
  }
}
