import 'package:flutter_mvp/sdk/network/utils/api_response.dart';
import 'package:flutter_mvp/sdk/patterns/interface/ihttp.dart';
import 'package:http/http.dart' as http;

class FlutterHttp implements IHTTP {
  String baseUrl = "https://api.randomuser.me/";

  @override
  Future iGet(String url, {Map<String, dynamic> queryParameters}) async {
    var res = await http.get(baseUrl + url);
    var result = ApiResponse().httpResponse(res);
    return result;
  }

  @override
  Future iPost(String url,
      {Map<String, dynamic> data, Map<String, dynamic> queryParameters}) async {
    var res = await http.post(baseUrl + url, body: data);
    var result = ApiResponse().httpResponse(res);
    return result;
  }

  @override
  Future iPut(String url,
      {Map<String, dynamic> data, Map<String, dynamic> queryParameters}) async {
    var res = await http.put(baseUrl + url, body: data);
    var result = ApiResponse().httpResponse(res);
    return result;
  }

  @override
  Future iDelete(String url,
      {Map<String, dynamic> data, Map<String, dynamic> queryParameters}) async {
    var res = await http.delete(baseUrl + url);
    var result = ApiResponse().httpResponse(res);
    return result;
  }
}
