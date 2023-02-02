import 'package:flutter/material.dart';
import 'package:numeros/Controllers/color_theme_controller.dart';

class MyButton1 extends StatefulWidget {
  String label;
  IconData icon;
  double height;
  void Function() onPressed;
  MyButton1({
    super.key,
    required this.label,
    required this.icon,
    required this.height,
    required this.onPressed,
  });

  @override
  State<MyButton1> createState() =>
      _MyButton1State(label, icon, height, onPressed);
}

class _MyButton1State extends State<MyButton1> {
  String _label;
  IconData _iconData;
  double _height;
  void Function() _onPressed;

  _MyButton1State(
    this._label,
    this._iconData,
    this._height,
    this._onPressed,
  );
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
          color: buttonBackgroundColor,
          borderRadius: BorderRadius.circular(20)),
      height: _height,
      child: InkWell(
        onTap: _onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _label,
                style: buttonTextStyle1,
              ),
              Icon(
                _iconData,
                color: buttonThemeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MyButton2 extends StatefulWidget {
  String label;
  IconData icon;
  double height;
  void Function() onPressed;
  MyButton2({
    super.key,
    required this.label,
    required this.icon,
    required this.height,
    required this.onPressed,
  });

  @override
  State<MyButton2> createState() => _MyButton2State(label,icon, height,onPressed);
}

class _MyButton2State extends State<MyButton2> {
  String _label;
  IconData _iconData; 
  double _height;
  void Function() _onPressed;

  _MyButton2State(
    this._label,
    this._iconData,
    this._height,
    this._onPressed,
  );
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(color: buttonBackgroundColor,
        borderRadius: BorderRadius.circular(20)),
        height: _height,
        child: InkWell(
          onTap: _onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_label,style: buttonTextStyle2,),
                Icon(_iconData,color: buttonThemeColor,),
              ],
            ),
          ),
        ),
      );
  }
}
