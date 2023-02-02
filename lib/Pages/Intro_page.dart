// ignore: file_names
import 'package:flutter/material.dart';
import 'package:numeros/Components/custom_button.dart';
import 'package:numeros/Pages/random_trivia_page.dart';
import 'package:page_transition/page_transition.dart';
import '../Components/theme_toggle_button.dart';
import '../Controllers/color_theme_controller.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({
    Key? key,
  }) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  void _changeTheme() {
    setState(() {
      ChangeTheme();
    });
  }
  void callBack() {
    setState(() {});
  }
  final String subTitle = "go through, find facts about some random numbers and grow your knowledge, be the smartest person in the room";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Animated Container Widget to get animation on swtiching themes

      body: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // BackGround gradient settings
              colors: backgroundGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading and Theme toggle button 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Numeros', style: titleStyle),
                    ToggleButton(icon: themeIcon, callBack: _changeTheme),
                  ],
                ),
                // fox abstract Potrait 
                Image.asset("assets/onboarding-potrait.png"),
                SizedBox(height: MediaQuery.of(context).size.height / 24),

                // Subtitle heading
                Text("Want some facts", style: subtitleStyle),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                
                // Subtitle
                Expanded(
                  // subtitle is in expanded widget to ensure the between is covered so the buttons remain in bottom
                  child: Text(
                      subTitle,
                      style: smallSubtitleStyle),
                ),

                // Divider line
                Divider(
                  thickness: 1,
                  color: primaryColor,
                  height: 0,
                ),

                // OnBoarding button
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MyButton1(
                    label: "Get started",
                    icon: Icons.arrow_forward_outlined,
                    height: 90,
                    onPressed: () {
                      // Navigation to next page
                      Navigator.push(
                        context,
                        PageTransition(
                            child: RandomTriviaPage(previousSetState: callBack),
                            type: PageTransitionType.rightToLeftWithFade),
                            
                      );
                    },
                  ),
                ),
                // Credits to developer
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      "Made by : Parag jain️ | with numbersapi.com",
                      style: FooterStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
