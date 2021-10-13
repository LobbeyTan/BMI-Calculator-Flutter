import 'package:demo/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calculator.dart';
import 'card.dart';
import 'constant.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  Gender _selectedGender = Gender.MALE;
  double height = 165;
  int weight = 58;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),
        backgroundColor: Color(0xFF11163A),
        leading: Icon(FontAwesomeIcons.stream),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  // First row
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          // Male
                          child: GenderCard(
                            icon: FontAwesomeIcons.mars,
                            text: "MALE",
                            isSelected: _selectedGender == Gender.MALE,
                            onPressed: () {
                              setState(() {
                                _selectedGender = Gender.MALE;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          // Female
                          child: GenderCard(
                            icon: FontAwesomeIcons.venus,
                            text: "FEMALE",
                            isSelected: _selectedGender == Gender.FEMALE,
                            onPressed: () {
                              setState(() {
                                _selectedGender = Gender.FEMALE;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Height widget
                  Expanded(
                    child: HeightCard(
                      value: height,
                      onChanged: (double val) {
                        setState(() {
                          height = val;
                        });
                      },
                    ),
                  ),
                  // Second Row
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          // Weight
                          child: CardWithButton(
                            title: "WEIGHT",
                            value: weight,
                            onPressedMinus: () {
                              setState(() {
                                weight--;
                              });
                            },
                            onPressedPlus: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          // Age
                          child: CardWithButton(
                            title: "AGE",
                            value: age,
                            onPressedMinus: () {
                              setState(() {
                                age--;
                              });
                            },
                            onPressedPlus: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calculator = Calculator(weight, height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    title: calculator.getResult(),
                    bmiScore: calculator.getBMI(),
                    advice: calculator.getAdvice(),
                  ),
                ),
              );
            },
            child: Container(
              height: 70,
              width: double.infinity,
              color: Colors.pink,
              child: Center(
                child: Text(
                  "CALCULATE YOUR BMI",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
