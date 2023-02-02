import 'package:flutter/material.dart';

bool darkTheme = false;
 
// Text Styles and color
Color primaryColor = Colors.white;
Color subtitleColor = Colors.white54;
Color smallSubtitleColor = Colors.white54;

TextStyle titleStyle = GetFont(40, primaryColor);
TextStyle subtitleStyle = GetFont(26, primaryColor);
TextStyle numberStyle = GetFont(24, primaryColor);
TextStyle smallSubtitleStyle = GetFont(16, smallSubtitleColor);
TextStyle FooterStyle = GetFont(14, smallSubtitleColor);

// Button Styles and color
Color buttonThemeColor = Color.fromRGBO(84, 111, 229, 1);
Color buttonBackgroundColor = Colors.white;
TextStyle buttonTextStyle1 = GetFont(28, buttonThemeColor);
TextStyle buttonTextStyle2 = GetFont(20, buttonThemeColor);

// Search bar style 
TextStyle searchHintStyle = GetFont(28, Color.fromRGBO(190, 190, 190, 1));

// Theme Icon
IconData themeIcon = Icons.light_mode_outlined;



List<Color> backgroundGradient = [
  Color.fromRGBO(47, 148, 224, 1),
  Color.fromRGBO(84, 111, 229, 1)
];

void ChangeTheme() {
  // Theme Changes to dark
  darkTheme = !darkTheme;

  // theme toggle button icon changes
  themeIcon = darkTheme ? Icons.dark_mode_outlined : Icons.light_mode_outlined;

  // Themes of button chnages
  buttonThemeColor = darkTheme ? primaryColor : Color.fromRGBO(84, 111, 229, 1);
  buttonBackgroundColor = darkTheme ? Color.fromRGBO(138,138, 138, 1) : primaryColor;
  buttonTextStyle1 = GetFont(28, buttonThemeColor);
  buttonTextStyle2 = GetFont(20, buttonThemeColor);


  // Theme of background changes
  backgroundGradient = [
    darkTheme ? Color.fromRGBO(27, 27, 27, 1) : Color.fromRGBO(47, 148, 224, 1),
    darkTheme ? Color.fromRGBO(56, 56, 56, 1) : Color.fromRGBO(84, 111, 229, 1),
  ];
}

TextStyle GetFont(double fontSize, Color color) => TextStyle(
      fontSize: fontSize,
      color: color,
    );
