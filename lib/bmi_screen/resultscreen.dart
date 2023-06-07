
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

  final double result;
  final int age;
  final bool isMale;

  SecondScreen({
    required this.result,
    required this.age,
    required this.isMale
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gender : ${isMale ? "Male" : "Female"}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0
            ),
            ),
            Text("Age : $age",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
              ),),
            Text("Result : ${result.round()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
              ),)
          ],
        ),
      ),
    );
  }
}
