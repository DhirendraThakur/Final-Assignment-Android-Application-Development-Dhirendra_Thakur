import 'dart:io';

import 'package:fitness/http/httpproduct.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fitness/model/product.dart';

class SupplementAdd extends StatefulWidget {
  const SupplementAdd({Key? key}) : super(key: key);

  @override
  _SupplementAddState createState() => _SupplementAddState();
}

class _SupplementAddState extends State<SupplementAdd> {
  final _formkey = GlobalKey<FormState>();
  File? _image;
  String? productname = "";
  String? producttype = "";
  String? productprice = "";

  @override
  void initState() {
    super.initState();
    _image = null;
  }

//method to open image from gallery
  _imageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

//method to open image from camera
  _imageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Supplement'),
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
                  'Add Supplement Details',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      letterSpacing: 5.0),
                ),
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _image == null
                        ? const AssetImage('images/profile_image.png')
                            as ImageProvider
                        : FileImage(_image!),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) => bottomSheet());
                      },
                      child: const Icon(
                        Icons.upload,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              TextFormField(
                onSaved: (value) {
                  productname = value!;
                },
                maxLength: 30,
                decoration: InputDecoration(
                    labelText: 'Product Name', hintText: 'Enter Product Name'),
              ),
              TextFormField(
                onSaved: (value) {
                  productprice = value!;
                },
                maxLength: 30,
                decoration: InputDecoration(
                    labelText: 'Product Rate', hintText: 'Enter Product Rate'),
              ),
              TextFormField(
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
                    if (_formkey.currentState == null) {
                      print("_formKey.currentState is null!");
                    } else if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      Product product = Product(
                        productname: productname,
                        productprice: productprice,
                        producttype: producttype,
                      );
                      HttpProduct().registerProduct(product, _image!);
                    }
                  },
                  child: Text('Add')),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/product/show');
                },
                child: Text('View Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      child: Column(
        children: [
          Text(
            'Choose Profile picture',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    _imageFromCamera();
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Camera')),
              ElevatedButton.icon(
                  onPressed: () {
                    _imageFromGallery();
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery'))
            ],
          )
        ],
      ),
    );
  }
}
