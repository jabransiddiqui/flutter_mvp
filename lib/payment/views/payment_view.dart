import 'package:flutter_mvp/payment/viewmodel/payment_model.dart';

abstract class PaymentView {
  void showPaymentDetail(PaymentModel items);

  void showError();
}