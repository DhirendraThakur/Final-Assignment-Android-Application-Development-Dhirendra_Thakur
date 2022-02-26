//import 'dart:ffi';

import 'package:fitness/http/httpproduct.dart';
import 'package:fitness/model/product.dart';
import 'package:flutter/material.dart';

class DisplayProduct extends StatefulWidget {
  const DisplayProduct({ Key? key }) : super(key: key);

  @override
  _DisplayProductState createState() => _DisplayProductState();
}

class _DisplayProductState extends State<DisplayProduct> {
  late Future <List<Product>> futureProduct;
  String photourl ='http://10.0.2.2:3000/uploads';
  
  @override
void initState(){
  super.initState();
 // futureProduct = HttpProduct().getProduct();
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Information'),),

      body: FutureBuilder<List<Product>>(
        future: futureProduct,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: ListTile(
                      title: Text('$index'),
                      subtitle: Text('${snapshot.data![index].productname} \t ${snapshot.data![index].producttype}'),
                    ),
                    );
                },

            );
          }
          else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();

        },
      ),
      
    );
  }
}