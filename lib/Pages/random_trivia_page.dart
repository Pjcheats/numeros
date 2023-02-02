import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:numeros/Components/custom_button.dart';
import 'package:numeros/Controllers/api_get_controller.dart';
import 'package:numeros/Pages/rapid_mode_page.dart';
import 'package:page_transition/page_transition.dart';
import '../Components/theme_toggle_button.dart';
import '../Controllers/color_theme_controller.dart';

class RandomTriviaPage extends StatefulWidget {
  void Function() previousSetState;
  RandomTriviaPage({Key? key, required this.previousSetState})
      : super(key: key);

  @override
  State<RandomTriviaPage> createState() =>
      _RandomTriviaPageState(previousSetState);
}

class _RandomTriviaPageState extends State<RandomTriviaPage> {
  void Function() previousSetState;
  _RandomTriviaPageState(this.previousSetState);

  // Previous state callback is called so all the pages in the route changes the theme
  void _changeTheme() {
    setState(() {
      ChangeTheme();
      previousSetState();
    });
  }

  void callBack() {
    previousSetState();
    setState(() {});
  }
  TextEditingController _textEditingController = TextEditingController(); 

  late FactModel factData ;

  void _GetRandomFact() async {
    factData = FactModel('','');
    setState((){});
    factData = await GetRandomFact();
    setState((){});
  }
  void _GetFactOf(String number) async {
    factData = FactModel('','');
    setState((){});
    factData = await GetFactOf(number);
    setState((){});
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
                    numberHeading(factData.number),
                    ToggleButton(icon: themeIcon, callBack: _changeTheme),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: factText(factData.factText),
                  ),
                ),
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
                        child: MyButton2(
                          label: "Random \ntrivia ",
                          icon: Icons.rotate_left_outlined,
                          height: 90,
                          onPressed: _GetRandomFact,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: MyButton2(
                          label: "Rapid \nmode",
                          icon: Icons.arrow_forward_outlined,
                          height: 90,
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: RapidModePage(
                                      previousSetState: callBack,
                                    ),
                                    type: PageTransitionType
                                        .rightToLeftWithFade));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                        color: buttonBackgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    height: 70,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 5),
                        child: TextField(
                          controller: _textEditingController,
                          onSubmitted: (value) {
                            _GetFactOf(_textEditingController.text);
                            _textEditingController.clear();
                          },
                          style: buttonTextStyle1,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'number',
                            suffixIcon: InkWell(
                              onTap: () { 
                                _GetFactOf(_textEditingController.text);
                                _textEditingController.clear();
                              },
                              child: Icon(
                                Icons.search,
                                size: 30,
                                color: buttonThemeColor,
                              ),
                            ),
                            hintStyle: searchHintStyle,
                          ),
                        ),
                      ),
                    ),
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
