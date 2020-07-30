import 'package:flutter_mvp/contacts/viewmodel/contact_model.dart';
import 'package:flutter_mvp/contacts/views/contact_view.dart';
import 'package:flutter_mvp/sdk/network/http/flutterhttp.dart';
import 'package:flutter_mvp/services/contact_service.dart';

class ContactPresenter {
  ContactView _view;

  ContactsApiService _contactsApiService;

  ContactPresenter(this._view) {
    _contactsApiService = new ContactsApiService(FlutterHttp());
  }
  void loadContacts() async {
    try {
      var responseR = await _contactsApiService.getContact();
      final List contactItems = responseR['results'];
      var list = contactItems
          .map((contactRaw) => new ContactModel.fromMap(contactRaw))
          .toList();
      _view.showContactList(list);
    } catch (e) {
      print("execpo");
      print(e);
      _view.showError();
    }
  }
}
