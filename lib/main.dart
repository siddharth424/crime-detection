import 'package:crime_detection/form.dart';
import 'package:crime_detection/login.dart';
import 'package:crime_detection/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crime_detection/widget/button_widget.dart';
import 'package:crime_detection/widget/navigation_drawer_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Home';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'register': (context) => MyRegister(),
          'login': (context) => MyLogin(),
          'form': (context) => MyForm(),
        },
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        backgroundColor: Colors.white,
        // endDrawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(MyApp.title),
          backgroundColor: Colors.indigo,
          elevation: 0,
        ),
        body: Builder(
          builder: (context) => Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 32),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage('home.jpg'), fit: BoxFit.cover),
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                SizedBox(height: 24.0),
                Text(
                  'Crime Detection And Reporting',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RaleWay',
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  'Our mission is to empower individuals and communities to take action against crime by providing them with the tools they need to detect, report, and prevent crime.',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 32.0),
                Text(
                  'Contact Us:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Email:',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'support@crimedetector.com',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Phone :',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '6380381945',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
