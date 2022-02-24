import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.blue, size: 30),
          onPressed: () {},
        ),
        title: const Text(
          'FIT-NESS  DashBoard',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.notifications,
              size: 30,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .7,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('images/background.jpg'))),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: const <Widget>[
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('images/fi.jpg'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9)),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.network(
                                      'https://image.shutterstock.com/image-photo/sliced-rye-bread-sunflower-seeds-600w-1444670357.jpg'),
                                  Text('Product')
                                ],
                              ),
                            ),
                          )
                        ],
                        crossAxisCount: 2),
                  ),
                  Expanded(
                    child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SvgPicture.network(
                                    'https://image.shutterstock.com/image-photo/sliced-rye-bread-sunflower-seeds-600w-1444670357.jpg'),
                                Text('Clothing')
                              ],
                            ),
                          )
                        ],
                        crossAxisCount: 3),
                  ),
                  Expanded(
                    child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SvgPicture.network(
                                    'https://image.shutterstock.com/image-photo/sliced-rye-bread-sunflower-seeds-600w-1444670357.jpg'),
                                Text('FeedBack')
                              ],
                            ),
                          )
                        ],
                        crossAxisCount: 3),
                  ),
                ],
              ),
            ),
          ),

          // Footer(child: Text('Hello Word'))
          FooterView(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: Center(
                  child: Text('Scrollable View'),
                ),
              ),
            ],
            footer: Footer(
              child: Text('Fitness Copyright @ no Where!!'),
              padding: EdgeInsets.all(10.0),
            ),
            flex: 1, //default flex is 2
          )
        ],
      ),
    );
    //default flex is 2
  }
}
