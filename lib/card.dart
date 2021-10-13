import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'button.dart';
import 'constant.dart';

class CardWithButton extends StatelessWidget {
  final String title;
  final int value;
  final void Function()? onPressedMinus;
  final void Function()? onPressedPlus;

  CardWithButton({
    required this.title,
    required this.value,
    this.onPressedMinus,
    this.onPressedPlus,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: kTitleTextStyle,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              value.toString(),
              style: kBigTitleTextStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                icon: FontAwesomeIcons.minus,
                onPressed: onPressedMinus,
              ),
              SizedBox(width: 10),
              CustomButton(
                icon: FontAwesomeIcons.plus,
                onPressed: onPressedPlus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeightCard extends StatelessWidget {
  final double value;
  final void Function(double)? onChanged;

  HeightCard({required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "HEIGHT",
            style: kTitleTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value.toInt().toString(),
                style: kBigTitleTextStyle,
              ),
              SizedBox(width: 5),
              Text(
                "cm",
                style: kTitleTextStyle,
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 1,
              activeTrackColor: Colors.white,
              inactiveTrackColor: Color(0xFF888992),
              thumbColor: Color(0xFFE92459),
              overlayColor: Color(0xFFE92459).withOpacity(0.3),
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 15,
              ),
            ),
            child: Slider(
              onChanged: onChanged,
              value: value,
              min: 120,
              max: 250,
            ),
          ),
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onPressed;
  final bool isSelected;

  GenderCard({
    required this.icon,
    required this.text,
    required this.isSelected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CardContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: (isSelected) ? Colors.white : Color(0xFF8B8C95),
              size: 90,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: (isSelected) ? Colors.white : Color(0xFF8B8C95),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
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
