import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UpdateAnnouncements extends StatefulWidget {
  const UpdateAnnouncements({Key? key}) : super(key: key);

  @override
  _UpdateAnnouncementsState createState() => _UpdateAnnouncementsState();
}

class _UpdateAnnouncementsState extends State<UpdateAnnouncements> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  void _postAnnouncement() async {
    String title = _titleController.text;
    String content = _contentController.text;

    // Create the announcement object
    Map<String, dynamic> announcement = {
      'title': title,
      'content': content,
      'timestamp': DateTime.now().toString(),
    };

    // Save the announcement to local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? announcements = prefs.getStringList('announcements');
    if (announcements == null) {
      announcements = [];
    }
    announcements.add(json.encode(announcement));
    await prefs.setStringList('announcements', announcements);

    // Clear the text fields
    _titleController.clear();
    _contentController.clear();

    // Show a success message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Announcement posted successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text('Post Announcement'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter the title',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Content:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _contentController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter the content',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _postAnnouncement,
              child: Text('Post Announcement'),
            ),
          ],
        ),
      ),
    );
  }
}
