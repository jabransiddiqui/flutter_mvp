class PaymentModel {

  final String fullName;

  final String phone;

  final String imageUrl;

  final String description;

  final String amount;

  const PaymentModel({this.fullName, this.phone, this.imageUrl, this.description,this.amount});

  PaymentModel.fromMap(Map<String, dynamic> map)
      : fullName = map['name'],
        phone = map['phone'],
        imageUrl = map['picture'],
        description = map['description'],
        amount = map['amount'];
}