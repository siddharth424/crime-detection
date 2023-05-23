import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SOSPage extends StatelessWidget {
  const SOSPage({Key? key}) : super(key: key);

  // Emergency hotline numbers in India
  static const emergencyHotlines = {
    'Police': '100',
    'Ambulance': '102',
    'Fire Brigade': '101',
    'Women Helpline': '1091',
    'Child Helpline': '1098',
    'Senior Citizen Helpline': '1291',
  };

  void _callEmergencyHotline(String hotlineNumber) async {
    String phoneNumber = 'tel:$hotlineNumber';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      // Handle error when the user's device does not support phone call functionality
      print('Unable to launch phone call');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: const Text('SOS'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: emergencyHotlines.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          final entry = emergencyHotlines.entries.elementAt(index);
          return ListTile(
            title: Text(
              entry.key,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              entry.value,
              style: const TextStyle(fontSize: 16.0),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.phone),
              onPressed: () => _callEmergencyHotline(entry.value),
            ),
          );
        },
      ),
    );
  }
}
