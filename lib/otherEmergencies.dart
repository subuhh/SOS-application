import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class otherEmergencies extends StatelessWidget {
  const otherEmergencies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 135, 4, 4),
                Color.fromARGB(255, 6, 0, 0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(5.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: [
              Card(
                child: Column(
                  children: [
                    Container(
                      height: 150, // Set the height of the container to control the size
                      width: 200,  // Set the width of the container to control the size
                      child: Lottie.asset('lib/Assets/Firebrigade.json'),
                    ),
                    Text('Call Firebrigade',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
                      height: 150, // Set the height of the container to control the size
                      width: 200,  // Set the width of the container to control the size
                      child: Lottie.asset('lib/Assets/Police.json'),
                    ),
                    Text('Call Police',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
                      height: 150, // Set the height of the container to control the size
                      width: 180,  // Set the width of the container to control the size
                      child: Lottie.asset('lib/Assets/Blood.json'),
                    ),
                    Text('Need blood',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
                      height: 150, // Set the height of the container to control the size
                      width: 200,  // Set the width of the container to control the size
                      child: Lottie.asset('lib/Assets/Ambulance.json'),
                    ),
                    Text('Call Ambulance',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}