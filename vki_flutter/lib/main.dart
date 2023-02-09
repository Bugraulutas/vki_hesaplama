import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'Female.dart';
import 'Male.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
          duration: 1300,
          splash: Icon(Icons.health_and_safety_outlined,color: Colors.white,size: 95,),
          nextScreen: MyHomePage(),
          splashTransition: SplashTransition.fadeTransition,

          backgroundColor: Colors.blue),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
        var pageList=[Male(),Female()];
        int _index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pageList[_index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(

                colors: [Colors.blue.shade400,Colors.purple.shade400],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
            ),
          borderRadius: BorderRadius.only(topLeft:  Radius.circular(25),topRight: Radius.circular(25)),
        ),
       

        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.male),
              label: "Erkek",



            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.female),
              label: "Kadın"


            )
          ],

          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          selectedFontSize: 17,
          currentIndex: _index,
          onTap: (index){
            setState(() {
              _index=index;
            });
          },


        ),
      ),
    );
  }
}
