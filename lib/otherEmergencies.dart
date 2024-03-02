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
          padding: EdgeInsets.all(20.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            children: [
              Card(
                child: Column(
                  children: [
                    Container(
                      height: 180, // Set the height of the container to control the size
                      width: 200,  // Set the width of the container to control the size
                      child: Lottie.asset('lib/Assets/Firebrigade.json'),
                    ),
                    Text('Call Firebrigade')
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
                      height: 180, // Set the height of the container to control the size
                      width: 200,  // Set the width of the container to control the size
                      child: Lottie.asset('lib/Assets/Police.json'),
                    ),
                    //SizedBox(height: 10,),
                    Text('Call Police')
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
                      height: 180, // Set the height of the container to control the size
                      width: 180,  // Set the width of the container to control the size
                      child: Lottie.asset('lib/Assets/Blood.json'),
                    ),
                    SizedBox(height: 10,),
                    Text('Need blood')
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
                      height: 180, // Set the height of the container to control the size
                      width: 200,  // Set the width of the container to control the size
                      child: Lottie.asset('lib/Assets/Ambulance.json'),
                    ),
                    Text('Call Ambulance')
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
