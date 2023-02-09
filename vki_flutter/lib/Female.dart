import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Female extends StatefulWidget {
  const Female({Key? key}) : super(key: key);

  @override
  State<Female> createState() => _FemaleState();
}

class _FemaleState extends State<Female> {

  double male_height_value=1;
  double male_weight_value=0;
  var color;
  var state;

  void change_male_weight(double x){
    setState(() {
      male_weight_value=x;
    });
  }

  void change_male_height(double y){
    setState(() {
      male_height_value=y;
    });
  }

  @override
  Widget build(BuildContext context) {
    double result=(male_weight_value/(male_height_value*male_height_value));

    if(result<=18.5){
      color=Colors.deepPurpleAccent;
      state="Zayıf";
    }else if(18.5<result&&result<=24.9){
      color=Colors.green;
      state="Normal kilolu";
    }else if(25<=result&&result<=29.9){
      color=Colors.red.shade400;
      state="Fazla kilolu";
    }
    else if(30<=result&&result<=34.9){
      color=Colors.red.shade500;
      state="1. Derece Obezite";
    }
    else if(35<=result&&result<=40){
      color=Colors.red.shade600;
      state="2. Derece Obezite";
    }
    else if(result>40&&result<=50){
      color=Colors.red.shade700;
      state="3. Derece Obezite / Morbid Obezite";
    }
    else if(result>50&&result<=60){
      color=Colors.red.shade800;
      state="Süper Obezite";
    }
    else if(result>60){
      color=Colors.red.shade900;
      state="Süper Süper Obezite";
    }

    return Scaffold(
      body: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white,Colors.purple],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter
                    ),
                    borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SleekCircularSlider(
                        initialValue: 0,
                        max: 135,
                        innerWidget: (double value) {
                          return Center(child: Text(
                            textAlign: TextAlign.center,
                            value.toInt().toString()+"\n kilo(kg)",style: TextStyle(fontSize: 18,color: Colors.black),));
                        },

                        appearance: CircularSliderAppearance(customColors: CustomSliderColors(trackColors: [Colors.white60,Colors.white],progressBarColors: [Colors.orange,Colors.orange.shade300,Colors.orangeAccent])),
                        onChange: (double value) {
                          change_male_weight(value);

                        }),
                  ),

                ),
              ),
              Expanded(
                child: Container(
                  width: 200,
                  height: 300,

                  decoration: BoxDecoration(
                  gradient: LinearGradient(
                  colors: [Colors.white,Colors.purple],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
                  ),
                    borderRadius: BorderRadius.only(bottomRight:  Radius.circular(25)),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SleekCircularSlider(

                        initialValue: 0,
                        max: 2,
                        innerWidget: (double value) {
                          return Center(child: Text(
                            textAlign: TextAlign.center,
                            value.toStringAsFixed(2)+"\n boy(m)",style: TextStyle(fontSize: 18,color: Colors.black),));
                        },

                        appearance: CircularSliderAppearance(customColors: CustomSliderColors(trackColors: [Colors.white60,Colors.white],progressBarColors: [Colors.orange,Colors.orange.shade300,Colors.orangeAccent])),

                        onChange: (double value) {

                          change_male_height(value);




                        }),
                  ),

                ),
              )

            ],

          ),

          Center(
            child: Container(
              color: Colors.white,

              width: double.maxFinite,
              height: 100,





              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Vücut Kitle Endeksi(VKİ)\n"+result.toStringAsFixed(1)+" (kg)/(m)2",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:color),
                ),
              ),

            ),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,

              color:Colors.white,



              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "$state",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:color),
                ),

              ),

            ),
          ),
        ],

      ),

    );
  }
}
