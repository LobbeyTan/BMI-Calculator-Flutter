import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF101438),
      ),
      home: BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatelessWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

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
                          ),
                        ),
                        Expanded(
                          // Female
                          child: GenderCard(
                            icon: FontAwesomeIcons.venus,
                            text: "FEMALE",
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Height widget
                  Expanded(
                    child: CardContainer(),
                  ),
                  // Second Row
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          // Height
                          child: CardContainer(),
                        ),
                        Expanded(
                          // Age
                          child: CardContainer(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String text;

  GenderCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  final Widget? child;

  CardContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Color(0xFF151A3C),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
