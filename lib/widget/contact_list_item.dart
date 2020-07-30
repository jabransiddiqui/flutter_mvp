import 'package:flutter/material.dart';
import 'package:flutter_mvp/contacts/viewmodel/contact_model.dart';

class ContactListItem extends ListTile {
  ContactListItem({ContactModel contact, GestureTapCallback onTap})
      : super(
            title: Text(contact.fullName),
            subtitle: Text(contact.phone),
            leading: CircleAvatar(child: Text(contact.fullName[0])),
            trailing: Container(
                child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 15,
            )),
            onTap: onTap);
}
