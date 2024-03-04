import 'package:flutter/material.dart';
import 'package:telephony_sms/telephony_sms.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class BloodNeeded extends StatefulWidget {
  const BloodNeeded({Key? key}) : super(key: key);
  @override
  State<BloodNeeded> createState() => _BloodNeededState();
}

class _BloodNeededState extends State<BloodNeeded> {
  String? _selectedBloodGroup;
  final List<String> _bloodGroups = ['A', 'B+', 'O', 'O-', 'AB-'];
  final TextEditingController _hospitalController = TextEditingController(); // Controller to capture text from TextField
  final _telephonySms = TelephonySMS();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Need', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 135, 4, 4),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "lib/Assets/187-1879841_iphone-7-plus-iphone-7-skyblue.jpg",
            ),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Color(0xFF710000),
              BlendMode.modulate,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'I need a blood group of : ',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedBloodGroup,
                hint: Text(
                  'Select a blood group',
                  style: TextStyle(color: Colors.white),
                ),
                onChanged: (newValue) {
                  setState(() {
                    _selectedBloodGroup = newValue;
                  });
                },
                items: _bloodGroups.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.blueAccent)),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Text(
                'At Hospital ',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  controller: _hospitalController, // Assign controller to TextField
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {

                  if (_selectedBloodGroup == null || _hospitalController.text.isEmpty) {
                    return ;
                  }

                  var status = await Permission.sms.request();
                  if (status.isGranted) {
                    print('Presed ME ');
                    final contacts = await FlutterContacts.getContacts( withProperties: true,);

                    List<String> phoneNumbers = [];
                    int c=0;
                    for (var contact in contacts) {
                      print(c);
                      for (var item in contact.phones!) {
                        phoneNumbers.add(item.number!);
                        print(item.number! + '   $c');
                        c++ ;
                      }
                    }
                    // Send SMS to all phone numbers
                    // for (var phoneNumber in phoneNumbers) {
                    //   _telephonySms.sendSMS(phone: phoneNumber, message: message);
                    // }

                  }
                },
                child: Text('Send Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
