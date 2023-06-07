

import 'dart:math';

import 'package:bmi_calculator/bmi_screen/resultscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi_Screen extends StatefulWidget {
  const Bmi_Screen({Key? key}) : super(key: key);

  @override
  _Bmi_ScreenState createState() => _Bmi_ScreenState();
}

class _Bmi_ScreenState extends State<Bmi_Screen> {

  bool isMale = true;
  double height = 120.0;
  int age = 10;
  int weight = 60;
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI_Calculator"
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(

                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){

                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 100,
                              width: 100,
                              image: AssetImage("assets/images/maleuser.png"),
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 25.0,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale ?  Colors.blue   : Colors.grey
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 100,
                              width: 100,
                              image: AssetImage("assets/images/personalwoman.jpg"),
                            ),
                            Text(
                                "Female",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale ? Colors.grey : Colors.blue
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0
              ),
              child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold
                    ),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,

                      children: [
                        Text("${height.round()}",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 35.0
                        ),),
                        Text("CM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                          ),),
                      ],
                    ),
                    Slider(
                        value: height,
                        min: 70.0,
                        max: 220.0,
                        onChanged: (value){
                          print(value.round());
                          setState(() {
                            height = value;
                          });
                        }
                    )

                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Age",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),),
                          Text("$age",
                            style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                mini: true,
                                  onPressed: (){
                                  setState(() {
                                    age--;
                                  });

                                  },
                                child: Icon(
                                  Icons.remove
                                ),
                                heroTag: "age-",
                                  ),
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                mini: true,
                                  child: Icon(
                                    Icons.add
                              ),
                                heroTag: "age+",
                                  ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Weight",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),),
                          Text("$weight",
                            style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                mini: true,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(
                                    Icons.remove
                                ),
                                heroTag: "weight-",

                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                child: Icon(
                                    Icons.add
                                ),
                                heroTag: "weight+",
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
                onPressed: (){
                    setState(() {
                      result = weight / pow(height / 100 , 2);
                      print(result);
                      print(weight);
                      print(height);
                      Navigator.push(
                          context,
                        MaterialPageRoute(builder: (context) => SecondScreen(age: age,isMale: isMale, result: result,))
                      );
                    });
                },
                height: 50.0,
                child: Text(
                  "Calculate",style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                ),
              ),
          ),


        ],
      ),
    );
  }
}
