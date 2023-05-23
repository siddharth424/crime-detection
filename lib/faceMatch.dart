import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MyFaceMatch extends StatefulWidget {
  const MyFaceMatch({Key? key}) : super(key: key);

  @override
  _MyFaceMatchState createState() => _MyFaceMatchState();
}

class _MyFaceMatchState extends State<MyFaceMatch> {
  File? imgFile;
  final imgPicker = ImagePicker();
  Map<String, dynamic>? firstPersonDetails;

  Future<void> searchAndDisplayDetails(String lastName) async {
    final url = Uri.parse(
        'https://jailbase-jailbase.p.rapidapi.com/search/?source_id=fl-suwa&last_name=$lastName');
    final headers = {
      'X-RapidAPI-Key': 'c7fa5a28aamsh571fe678269983ep11b1aejsnd7b77ba094d4',
      'X-RapidAPI-Host': 'jailbase-jailbase.p.rapidapi.com'
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final records = data['records'];
      if (records != null && records.isNotEmpty) {
        setState(() {
          firstPersonDetails = records[0];
        });
      } else {
        print('No records found!');
        setState(() {
          firstPersonDetails = null;
        });
      }
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Options"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text("Capture Image From Camera"),
                  onTap: () {
                    openCamera();
                  },
                ),
                Padding(padding: EdgeInsets.all(10)),
                GestureDetector(
                  child: Text("Take Image From Gallery"),
                  onTap: () {
                    openGallery();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void openCamera() async {
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    setState(() {
      imgFile = File(imgGallery!.path);
    });
    Navigator.of(context).pop();
  }

  Widget displayImage() {
    if (imgFile == null) {
      return Text("No Image Selected!");
    } else {
      return Image.file(imgFile!, width: 350, height: 350);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text(
          'Face Match',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            displayImage(),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                showOptionsDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
              ),
              child: Text("Select Image"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (imgFile != null) {
                  final lastName =
                      imgFile!.path.split('/').last.split('.').first;
                  searchAndDisplayDetails(lastName);
                } else {
                  print("No image selected!");
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
              ),
              child: Text("Search and Display Details"),
            ),
            SizedBox(height: 10),
            if (firstPersonDetails != null)
              ElevatedButton(
                onPressed: () {
                  final firstName = firstPersonDetails!['name'];
                  final List<dynamic> charges =
                      firstPersonDetails!['charges'] ?? [];
                  final bookDate = firstPersonDetails!['book_date_formatted'];
                  // final mugshotUrl = firstPersonDetails!['mugshot'];
                  final gender = firstPersonDetails!['details'][0][1];
                  final race = firstPersonDetails!['details'][1][1];
                  final age = firstPersonDetails!['details'][2][1];

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(firstName),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (charges.isNotEmpty)
                              Text(
                                'Charges:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (charges.isEmpty)
                              Text(
                                'No charges found.',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            for (var charge in charges) Text('- $charge'),
                            SizedBox(height: 10),
                            Text('Gender: $gender'),
                            Text('Race: $race'),
                            Text('$age'),
                            SizedBox(height: 10),
                            Text('Book Date: $bookDate'),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                ),
                child: Text("Show Details"),
              ),
            if (firstPersonDetails == null)
              Text(
                'No records found!',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
