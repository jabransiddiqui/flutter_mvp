import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mvp/payment/viewmodel/payment_model.dart';


class PaymentApiService {
  Future<PaymentModel> getPaymentDetail(String url, {Map<String, dynamic> queryParameters}) async {
    final DocumentReference document =   Firestore.instance.collection("payments").document(url);
    await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{
      var data = snapshot.data;
      var model =  new PaymentModel.fromMap(data);
      return model;
    });
  }
}