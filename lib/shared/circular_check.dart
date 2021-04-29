import 'package:flutter/material.dart';

class CircularCheck extends StatelessWidget {
  bool isSelected;
  VoidCallback onTap;

  CircularCheck({this.isSelected, this.onTap});

  Color get backgroundColor => isSelected ? Colors.green[300] : Colors.white;
  Color get borderColor => isSelected ? Colors.green[300] : Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(500),
              border: Border.fromBorderSide(BorderSide(color: borderColor))),
          child: Icon(
            Icons.check,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
