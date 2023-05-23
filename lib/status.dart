import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MyStatus extends StatefulWidget {
  const MyStatus({Key? key}) : super(key: key);

  @override
  _MyStatusState createState() => _MyStatusState();
}

class _MyStatusState extends State<MyStatus> {
  List<Map<String, dynamic>> formDataList = [];

  @override
  void initState() {
    super.initState();
    fetchFormDataList();
  }

  Future<void> fetchFormDataList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? formDataStrings = prefs.getStringList('formDataList');

    if (formDataStrings != null) {
      setState(() {
        formDataList = formDataStrings.map((formDataString) {
          return Map<String, dynamic>.from(jsonDecode(formDataString));
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text(
          'Track FIR',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: formDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> formData = formDataList[index];

                  return ListTile(
                    title: Text('FIR ID: ${formData['id']}'),
                    subtitle: Text(
                        'Full Name: ${formData['name']} \nMobile No: ${formData['phone']}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FormStatusPage(formData: formData),
                        ),
                      );
                    },
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

class FormStatusPage extends StatelessWidget {
  final Map<String, dynamic> formData;

  const FormStatusPage({Key? key, required this.formData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progressValue = formData['progressValue'] ?? 0.0;
    String status = formData['status'] ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text(
          'Track FIR',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Full Name: ${formData['name']}'),
              Text('Mobile No: ${formData['phone']}'),
              Text('Date of Birth: ${formData['dob']}'),
              Text('Address: ${formData['address']}'),
              Text('Aadhar: ${formData['aadhar']}'),
              Text('Occupation: ${formData['occupation']}'),
              Text('Nationality: ${formData['nationality']}'),
              Text('Offender Name: ${formData['offenderName']}'),
              Text('Start Date: ${formData['startDate']}'),
              Text('End Date: ${formData['endDate']}'),
              Text('Offence Type: ${formData['offenceType']}'),
              Text('Offence Place: ${formData['offencePlace']}'),
              Text('Details: ${formData['details']}'),
              // Display other form fields here

              SizedBox(height: 16.0),
              Text(
                'Track your FIR',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Progress:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0%',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    '100%',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Text(
                'Status:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                status,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
