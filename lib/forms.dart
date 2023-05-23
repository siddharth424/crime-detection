import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  void _saveFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? formDataList = prefs.getStringList('formDataList');
    if (formDataList == null) {
      formDataList = [];
    }

    Map<String, dynamic> formData = {
      'id': UniqueKey().toString(),
      'name': name.text,
      'phone': phone.text,
      'dob': dob,
      'address': address.text,
      'aadhar': aadhar.text,
      'occupation': occupation.text,
      'nationality': nationality.text,
      'offenderName': offenderName.text,
      'startDate': startDate,
      'endDate': endDate,
      'offenceType': offenceType.text,
      'offencePlace': offencePlace.text,
      'details': details.text,
      'suspectGender': suspectGender.text,
      'suspectAge': suspectAge.text,
      'suspectBuild': suspectBuild.text,
      'suspectHeight': suspectHeight.text,
      'suspectComplexion': suspectComplexion.text,
      'suspectDeformities': suspectDeformities.text,
      'suspectDialect': suspectDialect.text,
      'suspectMarks': suspectMarks.text,
      'status': "Registered",
      'progressValue': 0.2,
    };

    formDataList.add(json.encode(formData));
    await prefs.setStringList('formDataList', formDataList);
    print(formDataList);
  }

  String startDate = "";
  String endDate = "";
  String dob = "";
  int _activeStepIndex = 0;

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController aadhar = TextEditingController();

  TextEditingController offenderName = TextEditingController();
  TextEditingController offenceType = TextEditingController();
  TextEditingController offencePlace = TextEditingController();
  TextEditingController details = TextEditingController();

  TextEditingController suspectAge = TextEditingController();
  TextEditingController suspectBuild = TextEditingController();
  TextEditingController suspectComplexion = TextEditingController();
  TextEditingController suspectDeformities = TextEditingController();
  TextEditingController suspectDialect = TextEditingController();
  TextEditingController suspectGender = TextEditingController();
  TextEditingController suspectHeight = TextEditingController();
  TextEditingController suspectMarks = TextEditingController();

  TextEditingController pincode = TextEditingController();
  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Personal Information'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile No',
                  ),
                ),
                DateTimePicker(
                  initialValue: '',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Date of Birth',
                  onChanged: (val) => dob = val,
                  validator: (val) {
                    dob = val!;
                    return null;
                  },
                  onSaved: (val) => dob = val!,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: address,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Address',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: aadhar,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Aadhar number',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: occupation,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Occupation',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: nationality,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nationality',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Details of Incident/Offence'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: offenderName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name offender',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DateTimePicker(
                  initialValue: '',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Occurence of offence from',
                  onChanged: (val) => startDate = val,
                  validator: (val) {
                    startDate = val!;
                    return null;
                  },
                  onSaved: (val) => startDate = val!,
                ),
                const SizedBox(
                  height: 10,
                ),
                DateTimePicker(
                  initialValue: '',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Occurence of offence until',
                  onChanged: (val) => endDate = val,
                  validator: (val) {
                    endDate = val!;
                    return null;
                  },
                  onSaved: (val) => endDate = val!,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: offenceType,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Type of offence',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: offencePlace,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Place of offence',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: details,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Complete detail of the event',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Step(
            state:
                _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Details of Suspect'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: suspectGender,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sex',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: suspectAge,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Age of suspect',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: suspectBuild,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Build of suspect',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: suspectHeight,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Height of suspect',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: suspectComplexion,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Complexion of suspect',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: suspectDeformities,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Deformities of suspect',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: suspectDialect,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Dialect of suspect',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: suspectMarks,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Visible body marks of suspect',
                    ),
                  ),
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 3,
            title: const Text('Confirm'),
            content: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Full Name: ${name.text}'),
                Text('Mobile No : ${phone.text}'),
                Text('Date of birth: $dob'),
                Text('Full Address: ${address.text}'),
                Text('Aadhar: ${aadhar.text}'),
                Text('Occupation: ${occupation.text}'),
                Text('Nationality: ${nationality.text}'),
                Text(' '),
                Text('Offender Name: ${offenderName.text}'),
                Text('Occurence of offence from : ${startDate}'),
                Text('Occurence of offence until : ${endDate}'),
                Text('Type of offence : ${offenceType.text}'),
                Text('Location of offence : ${offencePlace.text}'),
                Text('Detail of offence : ${details.text}'),
                Text(' '),
                Text('Sex : ${suspectGender.text}'),
                Text('Age : ${suspectAge.text}'),
                Text('Build : ${suspectBuild.text}'),
                Text('Height : ${suspectHeight.text}'),
                Text('Complexion : ${suspectComplexion.text}'),
                Text('Deformities : ${suspectDeformities.text}'),
                Text('Dialect : ${suspectDialect.text}'),
                Text('Visible body marks of suspect : ${suspectMarks.text}'),
              ],
            )))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0,
          title: Text(
            'Reporting Crime',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Colors.red),
          ),
          child: Stepper(
            type: StepperType.vertical,
            currentStep: _activeStepIndex,
            steps: stepList(),
            onStepContinue: () {
              if (_activeStepIndex < (stepList().length - 1)) {
                setState(() {
                  _activeStepIndex += 1;
                });
              } else {
                _saveFormData();
                Fluttertoast.showToast(
                  msg: "Successful Submission",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                Navigator.pushNamed(context, 'home');
              }
            },
            onStepCancel: () {
              if (_activeStepIndex == 0) {
                return;
              }
              setState(() {
                _activeStepIndex -= 1;
              });
            },
            onStepTapped: (int index) {
              setState(() {
                _activeStepIndex = index;
              });
            },
            controlsBuilder: (context, controls) {
              final isLastStep = _activeStepIndex == stepList().length - 1;
              return Container(
                margin: EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controls.onStepContinue,
                        child: (isLastStep)
                            ? const Text('Submit')
                            : const Text('Next'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (_activeStepIndex > 0)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controls.onStepCancel,
                          child: const Text('Back'),
                        ),
                      )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
