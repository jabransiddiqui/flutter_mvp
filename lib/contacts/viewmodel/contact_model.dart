class ContactModel {
  final String fullName;

  final String phone;

  final String imageUrl;

  const ContactModel({this.fullName, this.phone, this.imageUrl});

  ContactModel.fromMap(Map<String, dynamic> map)
      : fullName = "${map['name']['first']} ${map['name']['last']}",
        phone = map['phone'],
        imageUrl = map['picture']['large'];
}
