import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UpdateStatus extends StatefulWidget {
  final Map<String, dynamic> formData;

  const UpdateStatus({Key? key, required this.formData}) : super(key: key);

  @override
  _UpdateStatusState createState() => _UpdateStatusState();
}

class _UpdateStatusState extends State<UpdateStatus> {
  late double _progressValue;
  late TextEditingController _statusController;

  @override
  void initState() {
    super.initState();
    _progressValue = widget.formData['progressValue'] ?? 0.0;
    _statusController = TextEditingController(text: widget.formData['status']);
  }

  @override
  void dispose() {
    _statusController.dispose();
    super.dispose();
  }

  void _updateProgress(double value) {
    setState(() {
      _progressValue = value;
    });
  }

  Future<void> _updateFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? formDataList = prefs.getStringList('formDataList');
    if (formDataList != null) {
      List<Map<String, dynamic>> decodedList = formDataList.map((data) {
        return json.decode(data) as Map<String, dynamic>;
      }).toList();
      int index = decodedList.indexWhere(
          (formData) => formData['phone'] == widget.formData['phone']);
      if (index != -1) {
        decodedList[index]['progressValue'] = _progressValue;
        decodedList[index]['status'] = _statusController.text;
        List<String> encodedList = decodedList.map((formData) {
          return json.encode(formData);
        }).toList();
        await prefs.setStringList('formDataList', encodedList);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: const Text('Update Status'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Full Name: ${widget.formData['name']}'),
              Text('Mobile No: ${widget.formData['phone']}'),
              Text('Date of Birth: ${widget.formData['dob']}'),
              Text('Address: ${widget.formData['address']}'),
              Text('Aadhar: ${widget.formData['aadhar']}'),
              Text('Occupation: ${widget.formData['occupation']}'),
              Text('Nationality: ${widget.formData['nationality']}'),
              Text('Offender Name: ${widget.formData['offenderName']}'),
              Text('Start Date: ${widget.formData['startDate']}'),
              Text('End Date: ${widget.formData['endDate']}'),
              Text('Offence Type: ${widget.formData['offenceType']}'),
              Text('Offence Place: ${widget.formData['offencePlace']}'),
              Text('Details: ${widget.formData['details']}'),
              Text('Suspect Gender: ${widget.formData['suspectGender']}'),
              Text('Suspect Age: ${widget.formData['suspectAge']}'),
              Text('Suspect Build: ${widget.formData['suspectBuild']}'),
              Text('Suspect Height: ${widget.formData['suspectHeight']}'),
              Text(
                  'Suspect Complexion: ${widget.formData['suspectComplexion']}'),
              Text(
                  'Suspect Deformities: ${widget.formData['suspectDeformities']}'),
              Text('Suspect Dialect: ${widget.formData['suspectDialect']}'),
              Text('Suspect Marks: ${widget.formData['suspectMarks']}'),
              // Display other form fields here

              const SizedBox(height: 16.0),

              Text(
                'Update Status:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),

              TextFormField(
                controller: _statusController,
                decoration: InputDecoration(
                  hintText: 'Enter status',
                ),
              ),

              const SizedBox(height: 16.0),

              Text(
                'Progress Value:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),

              Slider(
                value: _progressValue,
                min: 0.0,
                max: 1.0,
                onChanged: _updateProgress,
              ),

              const SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: () async {
                  await _updateFormData();

                  // Navigate back to the previous screen and pass the updated formData
                  Navigator.pop(context, widget.formData);
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
