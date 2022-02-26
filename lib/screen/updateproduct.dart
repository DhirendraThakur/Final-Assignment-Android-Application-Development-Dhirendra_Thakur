import 'dart:io';

import 'package:fitness/http/httpproduct.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fitness/model/product.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({Key? key,  required this.product}) : super(key: key);
  final Product product;

  @override
  _UpdateProductState createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final _formkey = GlobalKey<FormState>();
  String productname = "";
  String producttype = "";
  String productprice = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
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
                  'Update Product Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    letterSpacing: 5.0,
                  ),
                ),
              ),
              TextFormField(
                initialValue: widget.product.productname,
                onSaved: (value) {
                  productname = value!;
                },
                maxLength: 30,
                decoration: InputDecoration(
                    labelText: 'Product Name', hintText: 'Enter Product Name'),
              ),
              TextFormField(
                initialValue: widget.product.productprice,
                onSaved: (value) {
                  productprice = value!;
                },
                maxLength: 30,
                decoration: InputDecoration(
                    labelText: 'Product Rate', hintText: 'Enter Product Rate'),
              ),
              TextFormField(
                initialValue: widget.product.producttype,
                onSaved: (value) {
                  producttype = value!;
                },
                maxLength: 30,
                decoration: InputDecoration(
                    labelText: 'Product Type', hintText: 'Enter Product Type'),
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50)),
                onPressed: () {
                  _formkey.currentState!.save();
                  Product product = Product(
                    productname: productname,
                    productprice: productprice,
                    producttype: producttype,
                  );
                   HttpProduct().updateProduct(product,widget.product.id);
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
