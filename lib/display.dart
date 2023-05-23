import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:crime_detection/updatestatus.dart';

class DisplayForm extends StatefulWidget {
  const DisplayForm({Key? key}) : super(key: key);

  @override
  _DisplayFormState createState() => _DisplayFormState();
}

class _DisplayFormState extends State<DisplayForm> {
  List<Map<String, dynamic>> formList = [];

  @override
  void initState() {
    super.initState();
    _loadFormData();
  }

  void _loadFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic>? formDataList = prefs.getStringList('formDataList');
    if (formDataList != null) {
      List<Map<String, dynamic>> decodedList = formDataList.map((data) {
        return json.decode(data) as Map<String, dynamic>;
      }).toList();
      setState(() {
        formList = decodedList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: const Text('Form Submissions'),
      ),
      body: ListView.builder(
        itemCount: formList.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> formData = formList[index];
          return Card(
            child: ListTile(
              title: Text('Full Name: ${formData['name']}'),
              subtitle: Text('Mobile No: ${formData['phone']}'),
              onTap: () async {
                final updatedFormData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateStatus(formData: formData),
                  ),
                );

                if (updatedFormData != null) {
                  // Update the formList with the updated formData
                  final index = formList.indexOf(formData);
                  setState(() {
                    formList[index] = updatedFormData;
                  });
                }
              },
            ),
          );
        },
      ),
    );
  }
}
