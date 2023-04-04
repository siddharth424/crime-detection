import 'package:flutter/material.dart';

class MyAnnouncements extends StatefulWidget {
  const MyAnnouncements({super.key});

  @override
  State<MyAnnouncements> createState() => _MyAnnouncementsState();
}

class _MyAnnouncementsState extends State<MyAnnouncements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text(
          'Announcements',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Latest Crime Statistics: A 10% Decrease in Reported Crimes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Dear community members,\n\n'
                      'We are pleased to share with you that the latest crime statistics indicate a 10% decrease in reported crimes in our region as compared to the same period last year. While this is an encouraging development, we must continue to remain vigilant and take proactive measures to prevent crime.\n\n'
                      'Our crime detection app is here to assist you in staying informed and reporting any suspicious activities to the authorities. With the latest update, we have made significant improvements to the user interface, making it even more intuitive and user-friendly. Additionally, we have added a new feature that allows you to file a First Information Report (FIR) with ease, directly from the app.\n\n'
                      'As a responsible member of the community, it is our duty to come together and ensure the safety and security of our region. Our app is dedicated to providing you with real-time crime alerts and comprehensive information to keep you aware of the latest developments. With your support and our commitment, we can continue to make our community a safer place.\n\n'
                      'Download the latest version of our app now and stay up-to-date on the latest crime news in your area. Thank you for your continued trust and support.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '2 hours ago',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.indigo),
                          ),
                          child: Text('View'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
