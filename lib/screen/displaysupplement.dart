//import 'dart:ffi';

import 'package:fitness/http/httpproduct.dart';
import 'package:fitness/http/httpsupplement.dart';
import 'package:fitness/screen/updatesupplement.dart';
import 'package:flutter/material.dart';

import '../model/supplement.dart';

class DisplaySupplement extends StatefulWidget {
  const DisplaySupplement({Key? key}) : super(key: key);

  @override
  _DisplaySupplementState createState() => _DisplaySupplementState();
}

class _DisplaySupplementState extends State<DisplaySupplement> {
  late Future<List<Supplement>> futureSupplement = [] as Future<List<Supplement>>;
  String photourl = 'http://10.0.2.2:3000/uploads';

  @override
  void initState() {
    super.initState();
    // futureProduct = HttpProduct().getProducts()!;
    setState(() {
      futureSupplement = httpSupplement().getSupplements()!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Information'),
      ),
      body: FutureBuilder<List<Supplement>>(
        future: futureSupplement,
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
                              UpdateSupplement(supplement: snapshot.data![index]),
                        ),
                      );
                    },
                    child: ListTile(
                        title: Text('$index'),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${snapshot.data![index].supplementname} \t ${snapshot.data![index].supplementtype}'),
                            IconButton(
                                onPressed: () {
                                  httpSupplement()
                                      .deleteSupplement(snapshot.data![index].id);
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
