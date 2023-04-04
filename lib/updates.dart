import 'package:flutter/material.dart';

class MyUpdates extends StatefulWidget {
  const MyUpdates({super.key});

  @override
  State<MyUpdates> createState() => _MyUpdatesState();
}

class _MyUpdatesState extends State<MyUpdates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text(
          'Updates',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Recent Updates',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 24.0),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 3,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'First Update',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Dear users, we're excited to announce the first update of our crime detection app! With this update, we've made significant improvements to the user interface, making it even more intuitive and user-friendly. We've also added a new feature that allows you to easily file a First Information Report (FIR) directly from the app. And, as always, our app is built with the latest version of Flutter, ensuring a seamless experience for all users. We hope you enjoy this update and continue to use our app to stay safe and informed",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'March 31, 2023',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
