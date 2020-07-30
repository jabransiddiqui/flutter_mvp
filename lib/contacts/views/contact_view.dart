import 'package:flutter_mvp/contacts/viewmodel/contact_model.dart';

abstract class ContactView {
  void showContactList(List<ContactModel> items);

  void showError();
}
