import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void notify() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: 'Hello!',
          body: 'Welcome to our fitness page',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture:
              'https://images.idgesg.net/images/article/2019/01/android-q-notification-inbox-100785464-large.jpg?auto=webp&quality=85,70'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xfffdfdfdf),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.fitness_center, color: Colors.white, size: 30),
          onPressed: () {
            notify();
          },
        ),
        title: Text('Fitness Management'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('images/fi.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Welcome to the Global Fitness",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: const [
                              TextSpan(
                                text: '',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.blue),
                              ),
                              TextSpan(
                                  text: 'Sign Up!!!',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red,
                                  ))
                            ]))),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: const [
                            TextSpan(
                              text: 'LOGIN',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blueAccent),
                            ),
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.purple,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
