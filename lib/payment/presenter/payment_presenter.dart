import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mvp/payment/viewmodel/payment_model.dart';
import 'package:flutter_mvp/payment/views/payment_view.dart';
import 'package:flutter_mvp/services/payment_service.dart';

class PaymentPresenter {
  PaymentView _view;

  PaymentApiService _paymentsApiService;

  PaymentPresenter(this._view) {
    _paymentsApiService = new PaymentApiService();
  }
  void getDetail() async {
    try {
      final DocumentReference document = Firestore.instance
          .collection("payments")
          .document("JH0WEOMxuzmbT15BYZMq");
      await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
        var data = snapshot.data;
        var model = new PaymentModel.fromMap(data);
        _view.showPaymentDetail(model);
      });
    } catch (e) {
      print(e);
      _view.showError();
    }
  }
}
