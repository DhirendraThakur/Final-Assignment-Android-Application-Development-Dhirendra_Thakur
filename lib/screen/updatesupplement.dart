import 'dart:io';

import 'package:fitness/http/httpsupplement.dart';
import 'package:fitness/model/supplement.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fitness/model/product.dart';


class UpdateSupplement extends StatefulWidget {

  const UpdateSupplement({Key? key}) : super(key: key);

  @override
  _UpdateSupplementState createState() => _UpdateSupplementState();
}

class _UpdateSupplementState extends State<UpdateSupplement> {
  final _formkey = GlobalKey<FormState>();
  String supplementname = "";
  String supplementtype = "";
  String supplementrate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Supplement'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                'Update Supplement Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    letterSpacing: 5.0),
              ),
            ),
            TextFormField(
              onSaved: (value) {
                supplementname = value!;
              },
              maxLength: 30,
              decoration: InputDecoration(
                  labelText: 'Supplement Name',
                  hintText: 'Enter Supplement Name'),
            ),
            TextFormField(
              onSaved: (value) {
                supplementrate = value!;
              },
              maxLength: 30,
              decoration: InputDecoration(
                  labelText: 'Supplement Rate',
                  hintText: 'Enter Supplement Rate'),
            ),
            TextFormField(
              onSaved: (value) {
                supplementtype = value!;
              },
              maxLength: 30,
              decoration: InputDecoration(
                  labelText: 'Supplement Rate',
                  hintText: 'Enter Suppltment Rate'),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50)),
                onPressed: () {
                  _formkey.currentState!.save();
                  Supplement supplement = Supplement(
                    supplementname: supplementname,
                    supplementrate: supplementrate,
                    supplementtype: supplementtype,
                    //productdesc: productdesc
                  );
                  //  HttpProduct().registerProduct(product,productname);
                },
                child: Text('Update')),
            const SizedBox(
              height: 10,
            ),
          ],
        )),
      ),
    );
  }
}
