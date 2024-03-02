import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telephony_sms/telephony_sms.dart';

class SOSButton extends StatefulWidget {
  @override
  _SOSButtonState createState() => _SOSButtonState();
}

class _SOSButtonState extends State<SOSButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async { // Move async here
        setState(() {
          isClicked = !isClicked;
        });

        if (isClicked) {
          try {
            await _shareLocationWithFavorites();
            // print("Successfully shared location with favorites");
          } catch (e) {
            print("Error sharing location: $e");
          }
        }
      },
      child: Container(
        // Adjust container size as needed
        width: 200,
        height: 200,
        child: Lottie.asset(
          'lib/Assets/SOSbutton.json', // Path to your Lottie animation file
          animate: isClicked,
        ),
      ),
    );
  }
}
Future<void> _shareLocationWithFavorites() async {
  try {
    // Get current location
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Open the Hive box
   if(!(await Permission.sms.request().isGranted)){
     print('Sms Permission not granted');
     return ;
   }

    final contactsBox = await Hive.openBox('favorites');
    // print("Hive box 'favorites' opened successfully.");
    // Iterate through favorite contacts
    // print('Number of values in contactsBox: ${contactsBox.values.length}');

    for (var value in contactsBox.values) {
      print('fetching ...');
      print('Value is a ${value.runtimeType}: $value');

      print("trying to enter, ${value.runtimeType}");
      if (value is Map<String, dynamic>|| value is Map<dynamic,dynamic>) {


        if (value is Map<String, dynamic>) {
          print("IN 1");
          print("I am in <String, dynamic>");
          print('Value is a map: $value');
          if (value.containsKey('name')) { // Ensure 'name' key exists
            print('Value contains key "name": ${value['name']}');
            FavoriteContact contact = FavoriteContact.fromJson(value);
            print('Favorite contact name: ${contact
                .name}'); // Print contact name
            // Notify contact about shared location
            _notifyContact(contact, position.latitude, position.longitude);
          }
        }else if (value is Map<dynamic, dynamic>) {
          print("I am in <dynamic, dynamic>");
          Map<String, dynamic> typedMap = value.cast<String, dynamic>();
          FavoriteContact contact = FavoriteContact.fromJson(typedMap);
          print('Favorite contact name: ${contact.name}');
          _notifyContact(contact, position.latitude, position.longitude);
        }
        else {
          print("IN 3");
          print('Value does not contain key "name"');
        }
      }
      else {
        print('Value is not a map: $value');
      }
    }

    // Close the Hive box
    // await contactsBox.close();
  } catch (e) {
    print("Error sharing location: $e");
    // Handle error
  }
}

Future<void> _notifyContact(FavoriteContact contact, double latitude, double longitude) async {
  // Implement your logic to notify the contact about the shared location
  String phoneNumber = contact.phoneNumber;
  final _telephonySMS = TelephonySMS();
  await _telephonySMS.requestPermission();
  String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
  String message1 = 'Emergency: My location is Latitude: $latitude ,Longitude : $longitude  Track me at : $googleMapsUrl';
  await _telephonySMS.sendSMS(
      phone: phoneNumber,
      message: message1);
}
class FavoriteContact {
  String name;
  String phoneNumber;

  FavoriteContact({
    required this.name,
    required this.phoneNumber,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
  factory FavoriteContact.fromJson(Map<String, dynamic> json) {
    return FavoriteContact(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
    );
  }
}