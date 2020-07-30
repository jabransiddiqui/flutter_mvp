import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvp/payment/presenter/payment_presenter.dart';
import 'package:flutter_mvp/payment/viewmodel/payment_model.dart';
import 'package:flutter_mvp/payment/views/payment_view.dart';
import 'package:image_picker/image_picker.dart';

class PaymentDetail extends StatefulWidget {
  @override
  _PaymentDetailState createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> implements PaymentView {
  PaymentPresenter _presenter;

  PaymentModel _payment;

  bool _isLoading;

  File _image;

  String _uploadedFileURL;

  _PaymentDetailState() {
    _presenter = PaymentPresenter(this);
  }
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.getDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending"),
        elevation: 0.0,
      ),
      body: _isLoading == true
          ? Container(
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: CircularProgressIndicator())),
            )
          : Container(
              color: Color.fromRGBO(231, 233, 235, 1),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: 16),
                          child: Align(
                              alignment: FractionalOffset.center,
                              child: Text(
                                'Todays 8:13',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ))),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Stack(
                            fit: StackFit.passthrough,
                            alignment: AlignmentDirectional.center,
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      color: Color.fromRGBO(231, 233, 235, 1),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.only(top: 90),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              _payment.fullName,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            child: Text(
                                              "Rs ${_payment.amount}",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Text(
                                              _payment.description,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                child: Center(
                                    child: Stack(
                                  fit: StackFit.passthrough,
                                  alignment: AlignmentDirectional.center,
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Container(
                                      height: 150,
                                      width: 150,
                                      child: CircleAvatar(
                                        backgroundImage: (_payment.imageUrl !=
                                                    "" ||
                                                _payment.imageUrl != " ")
                                            ? NetworkImage("https://firebasestorage.googleapis.com/v0/b/flutter-mvp-179a5.appspot.com/o/profile?alt=media&token=90a70916-1556-4ef5-b89e-a1cd6c387a64")
                                            : (_uploadedFileURL != null
                                                ? Image.network(
                                                    _uploadedFileURL,
                                                  )
                                                : Container()),
                                      ),
                                    ),
                                    Positioned(
                                      top: 90,
                                      right: -5,
                                      child: GestureDetector(
                                        onTap: () {
                                          {
                                            final action = CupertinoActionSheet(
                                              title: Text(
                                                "Profile Photo",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              message: Text(
                                                "Select any source ",
                                                style:
                                                    TextStyle(fontSize: 15.0),
                                              ),
                                              actions: <Widget>[
                                                CupertinoActionSheetAction(
                                                  child: Text("Camera"),
                                                  isDefaultAction: true,
                                                  onPressed: () {
                                                    chooseCamera();
                                                  },
                                                ),
                                                CupertinoActionSheetAction(
                                                  child: Text("Gallery"),
                                                  isDefaultAction: true,
                                                  onPressed: () {
                                                    chooseGalleryFile();
                                                  },
                                                )
                                              ],
                                              cancelButton:
                                                  CupertinoActionSheetAction(
                                                child: Text("Cancel"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            );
                                            showCupertinoModalPopup(
                                                context: context,
                                                builder: (context) => action);
                                          }
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0))),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                        color: Colors.white,
                        height: 100,
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              child: Center(
                                  child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue.withOpacity(0.1)),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      "Decline",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              )),
                            )),
                            Expanded(
                                child: Container(
                              child: Center(
                                  child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      "Accept",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              )),
                            ))
                          ],
                        ),
                      )
                    ],
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      color: Colors.white,
                      height: 60,
                      padding: EdgeInsets.only(left: 8, right: 16),
                      child: Align(
                          alignment: FractionalOffset.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Phone:",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(_payment.phone)
                            ],
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 80,
                      color: Color.fromRGBO(231, 233, 235, 1),
                      child: Align(
                          alignment: FractionalOffset.center,
                          child: Text(
                            'Something wrong? Get help!',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          )))
                ],
              ),
            ),
    );
  }

  @override
  void showError() {}

  @override
  void showPaymentDetail(PaymentModel items) {
    setState(() {
      _payment = items;
      _isLoading = false;
    });
  }

  Future chooseGalleryFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
      uploadFile();
    });
  }

  Future chooseCamera() async {
    await ImagePicker.pickImage(source: ImageSource.camera).then((image) {
      setState(() {
        _image = image;
      });
      uploadFile();
    });
  }

  Future uploadFile() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('profile/');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        print(_uploadedFileURL);
        Firestore.instance
      .collection('payments')
        .document('JH0WEOMxuzmbT15BYZMq')
          .updateData({
            'picture': _uploadedFileURL,
          });
      });
      setState(() {
       _uploadedFileURL = fileURL;
      });
    });
  }
}