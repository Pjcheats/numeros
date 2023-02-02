
import 'dart:convert';
import 'package:http/http.dart';
class FactModel {
  String factText = '';
  String number = '' ;
  FactModel(this.factText,this.number);
}

Future<FactModel> GetRandomFact() async{
  Response response = await get(Uri.parse("http://numbersapi.com/random/trivia"));
  return FactModel(response.body,response.body.substring(0,response.body.indexOf(' ')));
}
 Future<FactModel> GetFactOf(String number) async{
  Response response = await get(Uri.parse("http://numbersapi.com/${number == '' ? 'random' :number}/trivia"));
  return FactModel(response.body,response.body.substring(0,response.body.indexOf(' ')));
}
 
