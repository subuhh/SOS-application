import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sos_system/RedeemPoints.dart';
import 'package:sos_system/RewardPoints.dart';
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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.account_circle,size: 200,),
            ),
            Text("UserName",textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),
            SizedBox(height: 10,),
            ListTile(title: Text("Emergency Contacts"),onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(ctx)=>Contacts() ));
            },),
            ListTile(title: Text("Favorites Contacts"),onTap: (){

            },),
            ListTile(title: Text("Rewards"),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(ctx)=>RewardPoints( ) ));
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
                  // Container(
                  //   width: 150.0,
                  //   height: 150.0,
                  //   decoration: BoxDecoration(
                  //     color:  Colors.transparent,
                  //     borderRadius: BorderRadius.all( Radius.circular(1100.0)),
                  //     border: Border.all(
                  //       color: Colors.white,
                  //       width: 7.0,
                  //     ),
                  //   ),
                  //   child: Center(child: Text('SOS',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),)),
                  // ),
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
