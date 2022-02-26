import 'dart:io';

import 'package:fitness/http/httpproduct.dart';
import 'package:fitness/http/httpsupplement.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fitness/model/supplement.dart';

class UpdateSupplement extends StatefulWidget {
  const UpdateSupplement({Key? key,  required this.supplement}) : super(key: key);
  final Supplement supplement;

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
          key: _formkey,
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
                    letterSpacing: 5.0,
                  ),
                ),
              ),
              TextFormField(
                initialValue: widget.supplement.supplementname,
                onSaved: (value) {
                  supplementname = value!;
                },
                maxLength: 30,
                decoration: InputDecoration(
                    labelText: 'Supplement Name', hintText: 'Enter Product Name'),
              ),
              TextFormField(
                initialValue: widget.supplement.supplementrate,
                onSaved: (value) {
                  supplementrate = value!;
                },
                maxLength: 30,
                decoration: InputDecoration(
                    labelText: 'Supplement Rate', hintText: 'Enter Supplement Rate'),
              ),
              TextFormField(
                initialValue: widget.supplement.supplementtype,
                onSaved: (value) {
                  supplementtype = value!;
                },
                maxLength: 30,
                decoration: InputDecoration(
                    labelText: 'Supplement Type', hintText: 'Enter Supplement Type'),
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
                  );
                  httpSupplement().updateSupplement(supplement,widget.supplement.id);
                },
                child: Text('Update'),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
