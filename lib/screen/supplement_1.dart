import 'dart:io';

import 'package:fitness/http/httpsupplement.dart';
import 'package:fitness/model/supplement.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SuppleAdd extends StatefulWidget {
  const SuppleAdd({Key? key}) : super(key: key);

  @override
  _SuppleAddState createState() => _SuppleAddState();
}

class _SuppleAddState extends State<SuppleAdd> {
  final _formkey = GlobalKey<FormState>();
  File? _image;
  String supplementname = "";
  String supplementtype = "";
  String supplementrate = "";

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
                              builder: (builder) => bottomSheet(context,
                                  _imageFromGallery, _imageFromCamera));
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
                    supplementname = value!;
                  },
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelText: 'Supplement Name',
                    hintText: 'Enter Supplement Name',
                  ),
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
                      labelText: 'Supplement Type',
                      hintText: 'Enter Supplement Type'),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      _formkey.currentState!.save();
                      Supplement supplement = Supplement(
                        supplementname: supplementname,
                        supplementtype: supplementtype,
                        supplementrate: supplementrate,
                      );
                      print(supplement);
                      httpSupplement().registerSupplement(supplement);
                    },
                    child: Text('Add')),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    child: Text('View Supplement')),
              ],
            )),
      ),
    );
  }
}

Widget bottomSheet(BuildContext context, Function() imageFromGallery,
    Function() imageFromCamera) {
  return Container(
    child: Column(
      children: [
        Text(
          'Choose picture',
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
                  imageFromCamera();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.image),
                label: Text('Camera')),
            ElevatedButton.icon(
                onPressed: () {
                  imageFromGallery();
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
