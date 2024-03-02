import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sos_system/Favorites.dart';
import 'package:sos_system/RedeemPoints.dart';
import 'package:sos_system/RewardPoints.dart';
import 'package:sos_system/otherEmergencies.dart';
import 'package:sos_system/screens/signin_screen.dart';
import 'contacts.dart';
import 'widgets/SoSbutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message ="After pressing the button \n we will send an emergengy alert \nto people near you and inform \nto nearest police station" ;
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xFF710000),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.account_circle,size: 200,color: Colors.white,),
            ),
            Text("UserName",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.white),),
            SizedBox(height: 10,),
            ListTile(title: Text("Contacts",style: TextStyle(fontSize: 25,color: Colors.white),),onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(ctx)=>Contacts()));
            },),
            ListTile(title: Text("Favorites Contacts",style: TextStyle(fontSize: 25,color: Colors.white),),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(ctx)=>Favorite()));
            },),
            ListTile(title: Text("Rewards",style: TextStyle(fontSize: 25,color: Colors.white),),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(ctx)=>RewardPoints()));
            },),
            ListTile(title: Text("Other emergencies",style: TextStyle(fontSize: 25,color: Colors.white),),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(ctx)=>otherEmergencies()));
            },),
            ListTile(title: Text("Sign Out",style: TextStyle(fontSize: 25,color: Colors.white),),onTap: (){
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed Out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });

            },),
          ],
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/Assets/187-1879841_iphone-7-plus-iphone-7-skyblue.jpg",),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Color(0xFF710000), BlendMode.modulate),
          ),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context)=>InkWell(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                alignment: Alignment.centerLeft,
                color: Colors.transparent,
                height: 100,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.line_weight_rounded,color: Colors.white,size: 40,),
                ),
              ),
            )),
            Expanded(
              child: Column(
              
                mainAxisAlignment: MainAxisAlignment.center,
              
                children: [
                  SOSButton(),
                  SizedBox(height: 40,),
                  Text("Hold button for 3 seconds \nif you are into any Danger",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
