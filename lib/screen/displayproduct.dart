//import 'dart:ffi';

import 'package:fitness/http/httpproduct.dart';
import 'package:fitness/model/product.dart';
import 'package:fitness/screen/updateproduct.dart';
import 'package:fitness/screen/updatesupplement.dart';
import 'package:flutter/material.dart';

class DisplayProduct extends StatefulWidget {
  const DisplayProduct({Key? key}) : super(key: key);

  @override
  _DisplayProductState createState() => _DisplayProductState();
}

class _DisplayProductState extends State<DisplayProduct> {
  late Future<List<Product>> futureProduct = [] as Future<List<Product>>;
  String photourl = 'http://10.0.2.2:3000/uploads';

  @override
  void initState() {
    super.initState();
    // futureProduct = HttpProduct().getProducts()!;
    setState(() {
      futureProduct = HttpProduct().getProducts()!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Information'),
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProduct,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UpdateProduct(product: snapshot.data![index]),
                        ),
                      );
                    },
                    child: ListTile(
                        title: Text('$index'),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${snapshot.data![index].productname} \t ${snapshot.data![index].producttype}'),
                            IconButton(
                                onPressed: () {
                                  HttpProduct()
                                      .deleteProduct(snapshot.data![index].id);
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        )),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
