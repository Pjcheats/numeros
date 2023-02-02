import 'package:flutter/material.dart';
import '../Controllers/color_theme_controller.dart';

class ToggleButton extends StatelessWidget {
  void Function() callBack;
  IconData icon;
  ToggleButton({super.key, required this.icon,required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: primaryColor,
            width: 1,
          ),
        ),
        child: InkWell(
        onTap: callBack,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: primaryColor,
            ),
          ),
      ),
    );
  }
}
/**
 * Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: primaryColor,
            width: 1,
          ),
        ),
        child:
 */