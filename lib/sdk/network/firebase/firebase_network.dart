import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mvp/payment/viewmodel/payment_model.dart';
import 'package:flutter_mvp/sdk/patterns/interface/ihttp.dart';

class FirebaseNetwork implements IHTTP {
  @override
   Future<PaymentModel> iGet(String url, {Map<String, dynamic> queryParameters}) async {
    final DocumentReference document =   Firestore.instance.collection("payments").document(url);
    await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{

      var data = snapshot.data;
      var model =  new PaymentModel.fromMap(data);
      print(model.fullName);
      return model;
    });
  }

  @override
  Future iPost(String url,
      {Map<String, dynamic> data, Map<String, dynamic> queryParameters}) async {
   
  }

  @override
  Future iPut(String url,
      {Map<String, dynamic> data, Map<String, dynamic> queryParameters}) async {
   
  }

  @override
  Future iDelete(String url,
      {Map<String, dynamic> data, Map<String, dynamic> queryParameters}) async {
   
  }
}