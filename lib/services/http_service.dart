import 'dart:convert';
import 'package:http/http.dart';

import '../model/contact_model.dart';
import 'log_service.dart';


class Network {
  static String BASE = "67541b0536bcd1eec8502b98.mockapi.io";
  static Map<String,String> headers = {'Content-Type':'application/json'};

  /* Http Apis */

  static String API_LIST = "/contacts/contacts";
  static String API_CREATE = "/contacts/contacts";
  static String API_UPDATE = "/contacts/contacts/"; //{id}
  static String API_DELETE = "/contacts/contacts/"; //{id}

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      LogService.d(response.body);
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('yaratildi');
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      LogService.d("yangilandi");
      return response.body;

    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      print('ajoyib');
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Contact contact) {
    Map<String, String> params = new Map();
    params.addAll({
      'full_name': contact.fullName,
      'phone': contact.phone,

    });
    return params;
  }

  static Map<String, String> paramsUpdate(Contact contact) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': contact.id .toString(),
      'full_name': contact.fullName,
      'phone': contact.phone,

    });
    return params;
  }

  // parsing

  static List<Contact> parsePostList(String response){
    dynamic json = jsonDecode(response);
    var data = List<Contact>.from(json.map((x)=>Contact.fromJson(x)));
    return data;
  }
}