import 'dart:convert';
import 'package:dio/dio.dart';  // Import Dio
import '../model/contact_model.dart';
import 'log_service.dart';

class Network {
  static String BASE = "https://67541b0536bcd1eec8502b98.mockapi.io"; // Ensure full URL
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Dio dio = Dio(BaseOptions(
    baseUrl: BASE,
    headers: headers,
    responseType: ResponseType.json,
  ));

  /* Http Apis */
  static String API_LIST = "/contacts/contacts";
  static String API_CREATE = "/contacts/contacts";
  static String API_UPDATE = "/contacts/contacts/"; //{id}
  static String API_DELETE = "/contacts/contacts/"; //{id}

  /* Http Requests */

  // GET Request
  static Future<List<Contact>?> GET(String api, Map<String, String> params) async {
    try {
      Response response = await dio.get(api, queryParameters: params);
      if (response.statusCode == 200) {
        LogService.d(response.data.toString());
        return parsePostList(jsonEncode(response.data));
      }
    } catch (e) {
      LogService.d("GET request failed: $e");
    }
    return null;
  }

  // POST Request
  static Future<Contact?> POST(String api, Map<String, String> params) async {
    try {
      Response response = await dio.post(api, data: params);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LogService.d('Created successfully');
        return Contact.fromJson(response.data);
      }
    } catch (e) {
      LogService.d("POST request failed: $e");
    }
    return null;
  }

  // PUT Request
  static Future<Contact?> PUT(String api, Map<String, String> params) async {
    try {
      Response response = await dio.put(api, data: params);
      if (response.statusCode == 200) {
        LogService.d("Updated successfully");
        return Contact.fromJson(response.data);
      }
    } catch (e) {
      LogService.d("PUT request failed: $e");
    }
    return null;
  }

  // DELETE Request
  static Future<void> DEL(String api, Map<String, String> params) async {
    try {
      Response response = await dio.delete(api, data: params);
      if (response.statusCode == 200) {
        LogService.d("Deleted successfully");
      }
    } catch (e) {
      LogService.d("DELETE request failed: $e");
    }
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    return {};
  }

  static Map<String, String> paramsCreate(Contact contact) {
    return {
      'full_name': contact.fullName,
      'phone': contact.phone,
    };
  }

  static Map<String, String> paramsUpdate(Contact contact) {
    return {
      'id': contact.id.toString(),
      'full_name': contact.fullName,
      'phone': contact.phone,
    };
  }

  // Parsing Response Data

  static List<Contact> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    return List<Contact>.from(json.map((x) => Contact.fromJson(x)));
  }
}
