import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  CustomButton({
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints.tightFor(
        width: 40,
        height: 40,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF222434),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: FaIcon(icon),
      ),
      onPressed: onPressed,
    );
  }
}
