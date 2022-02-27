//import 'dart:ffi';

import 'package:flutter/material.dart';

//import 'package:flutter_svg/flutter_svg.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:timezone/timezone.dart' as tz;
import 'package:awesome_notifications/awesome_notifications.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
// FlutterLocalNotificationsPlugin? fltrNotification;
// @override
//  void initState() {
//    super.initState();
//    var androidInitilize = new AndroidInitializationSettings('app_icon');
//    var iOSinitilize = new IOSInitializationSettings();
//    var initilizationsSettings =
//        new InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
//    fltrNotification = new FlutterLocalNotificationsPlugin();
//    fltrNotification!.initialize(initilizationsSettings, onSelectNotification: notificationSelected);
//  }

// Future _showNotification() async {
//    var androidDetails = AndroidNotificationDetails(
//        "Channel ID", "Fitness", importance: Importance.max);
//    var iSODetails = new IOSNotificationDetails();
//    var generalNotificationDetails = new NotificationDetails(android: androidDetails, iOS: iSODetails);

  // await fltrNotification.show(
  //     0, "Task", "You created a Task",
  //     generalNotificationDetails, payload: "Task");

//     var scheduledTime = DateTime.now().add(Duration(seconds : 5));

//  fltrNotification.sch(1, "Times Uppp", task,
//      scheduledTime, generalNotificationDetails);
  //}

  void notify() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: 'Title for your notification',
          body: 'body text/ content',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture:
          'https://images.idgesg.net/images/article/2019/01/android-q-notification-inbox-100785464-large.jpg?auto=webp&quality=85,70'),
    );
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.fitness_center, color: Colors.blue, size: 30),
          onPressed: () {
            notify();
          },
        ),
        title: const Text(
          'FIT-NESS  DashBoard',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Align(
            alignment: Alignment.topLeft,
          ),
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Product')),
              PopupMenuItem<int>(value: 1, child: Text('Supplement')),
              PopupMenuItem<int>(value: 2, child: Text('Sensors')),
            ],
            onSelected: (value){
              onSelected(context, value);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.logout,
              size: 30,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
              constraints: BoxConstraints.expand(),
              height: size.height * .0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('images/background.jpg'),
                    fit: BoxFit.scaleDown),
              ),
              child: TextField(
                decoration:
                    InputDecoration(fillColor: Colors.amber, filled: true),
              )),

          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
            child: SafeArea(
              child: Padding(
                // padding: EdgeInsets.all(10.0),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),

                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(bottom: 60),
                      child: Row(
                        children: const <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('images/fi.jpg'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/dum.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/health.jpeg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/product.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Center(
              child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
                child: IconButton(
                  icon: Icon(Icons.notification_add,
                      color: Colors.blue, size: 30),
                  onPressed: () {},
                ),
              ),
            ),
          )),

          Center(
              child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
                child: IconButton(
                  icon: Icon(Icons.notification_add,
                      color: Colors.blue, size: 30),
                  onPressed: () {
                    print("reached");
                  },
                ),
              ),
            ),
          )),

          // Footer(child: Text('Hello Word'))
          FooterView(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 600.0),
                child: Center(
                  child: Text('+'),
                ),
              ),
            ],
            footer: Footer(
              child: Text('Fitness Copyright @ Dhirendra!!'),
              padding: EdgeInsets.all(10.0),
            ),
            flex: 1, //default flex is 2
          )
        ],
      ),
    );
    //default flex is 2
  }

//   Future  notificationSelected(String payload) async {
//    showDialog(
//      context: context,
//      builder: (context) => AlertDialog(
//        content: Text("Notification : $payload"),
//      ),
//    );
//  }
// }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.pushNamed(context, '/product/add');
        break;
      case 1:
        Navigator.pushNamed(context, '/supplement/add');
        break;
      case 2:
        Navigator.pushNamed(context, '/sensor');
        break;
    }

  }
}
