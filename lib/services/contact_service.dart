import 'package:flutter_mvp/sdk/patterns/interface/ihttp.dart';

class ContactsApiService {
  IHTTP ihttp;

  ContactsApiService(this.ihttp) {}

  Future<dynamic> getContact() async {
    try {
      var a = ihttp.iGet("?results=15");
      return a;
    } catch (e) {
      return e;
    }
  }
}
