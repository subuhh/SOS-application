import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class otherEmergencies extends StatelessWidget {
  const otherEmergencies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate dynamic padding based on screen height to center the grid items vertically
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = screenHeight * 0.2; // Adjust this value as needed

    return Scaffold(
      appBar: AppBar(
        title: Text("Other Emergency",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor:Color.fromARGB(255, 135, 4,4),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
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
          child: Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: [
                // Repeat this structure for each card you want to display
                Card(
                  child: Column(
                    children: [
                      Container(
                        height: 150, // Set the height of the container to control the size
                        width: 200,  // Set the width of the container to control the size
                        child: Lottie.asset('lib/Assets/Firebrigade.json'),
                      ),
                      Text('Call Firebrigade',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
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
                      Text('Call Police',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
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
                      Text('Need blood',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
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
                      Text('Call Ambulance',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                // Add more cards here following the same structure
              ],
            ),
          ),
        ),
      ),
    );
  }
}
