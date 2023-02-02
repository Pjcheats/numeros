import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:numeros/Components/custom_button.dart';
import 'package:numeros/Controllers/api_get_controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../Components/theme_toggle_button.dart';
import '../Controllers/color_theme_controller.dart';

class RapidModePage extends StatefulWidget {
  void Function() previousSetState;
  RapidModePage({Key? key, required this.previousSetState}) : super(key: key);

  @override
  State<RapidModePage> createState() => RapidModePageState(previousSetState);
}

class RapidModePageState extends State<RapidModePage> {
  void Function() previousSetState;
  late FactModel factData ;
  double _value = 0;
  RapidModePageState(this.previousSetState);

  void _GetRandomFact() async {
    factData = FactModel('','');
    setState((){});
    factData = await GetRandomFact();
    setState((){
      _value = 1;
    });
  }
  void _changeTheme() {
    setState(() {
      previousSetState();
      ChangeTheme();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _GetRandomFact();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleButton(
                        icon: Icons.close,
                        callBack: () {
                          Navigator.pop(context);
                        }),
                    numberHeading(
                        factData.number),
                    ToggleButton(icon: themeIcon, callBack: _changeTheme),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: factText(
                        factData.factText),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 90),
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 10000,
                      onAnimationEnd: (() {
                        setState(() {
                           _GetRandomFact();
                           _value = 0;
                        });
                      }),
                      percent: _value,
                      lineHeight: 20,
                      barRadius: const Radius.circular(5),
                      progressColor: Colors.white,
                      backgroundColor: Colors.white24,
                    )),
                Divider(
                  thickness: 1,
                  color: primaryColor,
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: MyButton1(
                          label: "Random trivia ",
                          icon: Icons.arrow_back_sharp,
                          height: 90,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Made by : Parag jain️ | with numbersapi.com",
                    style: FooterStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget factText(String factText) {
    return factText == ''
        ? SpinKitRing(
            lineWidth: 3,
            size: 50,
            color: primaryColor,
          )
        : Text(
            factText,
            textAlign: TextAlign.center,
            style: subtitleStyle,
          );
  }

  Widget numberHeading(String number) {
    return number == ''
        ? SpinKitPianoWave(
            size: 20,
            color: primaryColor,
          )
        : Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: primaryColor, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(number,
                  style: numberStyle, overflow: TextOverflow.ellipsis),
            ),
          );
  }
}
