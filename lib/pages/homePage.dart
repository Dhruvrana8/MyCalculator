import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_calculator/widgets/myButton.dart';

class myHomePage extends StatefulWidget {
  @override
  _myHomePageState createState() => _myHomePageState();
}
class _myHomePageState extends State<myHomePage> {
  final List <String> buttons = [
    "C","Del","%","/",
    "9","8","7","x",
    "6","5","4","-",
    "3","2","1","+",
    ".","0","Ans","=",
  ];
   String userQuestion="";
   String userAnswer="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color.fromRGBO(250, 150, 8, 1),
          body: Stack(
              children: <Widget>[
                Center(
                  child: Expanded(
                      child: Image.asset('assets/dragon1.png',
                        fit: BoxFit.cover,
                      ),
                  ),
                ),
                Column(
                children: <Widget>[
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget>[
                          Container(
                              child: Text(userQuestion,style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Trajan Pro',
                                color: Colors.white
                              )),
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Container(
                              child: Text(userAnswer,style:TextStyle(
                                fontSize: 35,
                                fontFamily: 'Trajan Pro',
                                color: Colors.white
                              )),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 10),
                          ),
                        ]
                    ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Center(
                      child: GridView.builder(
                        itemCount: buttons.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                          itemBuilder: (BuildContext context,int index){
                            if (index == 0){
                              return myButton(
                                onTap: (){
                                  setState(() {
                                    userQuestion = "";
                                    userAnswer ="";
                                  });
                                },
                                text: buttons[index],
                                buttonColor: Colors.green[800],
                                textColor: Colors.white,
                              );
                            }else if(index == 1){
                              return myButton(
                                onTap: (){
                                  setState(() {
                                    userQuestion = userQuestion.substring(0,userQuestion.length-1);
                                  });
                                },
                                text: buttons[index],
                                buttonColor: Color.fromRGBO(141, 2,31, 0.9),
                                textColor:Colors.white,
                              );
                            }else if(index == buttons.length-2){
                              return myButton(
                                onTap: (){
                                  setState(() {
                                    equalPressed ();
                                    userQuestion = "";
                                  });
                                },
                                text: buttons[index],
                                buttonColor: Colors.grey[800],
                                textColor:Colors.white,
                              );
                            }
                            else if(index == buttons.length-1){
                              return myButton(
                                onTap: (){
                                  setState(() {
                                    equalPressed ();
                                  });
                                },
                                text: buttons[index],
                                buttonColor: Colors.grey[900],
                                textColor:Colors.white,
                              );
                            }
                            else{
                              return myButton(
                                onTap: (){
                                  setState(() {
                                    userQuestion += buttons[index];
                                  });
                                },
                                text: buttons[index],
                                buttonColor: isOperator(buttons[index]) ? Colors.grey[900]: Colors.grey[800],
                                textColor: isOperator(buttons[index]) ? Colors.white: Colors.grey[900],
                              );
                            }
                          },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]
          ),
    );
  }
  bool isOperator(String x){
    if (x == "%" || x == "/" ||x == "-" ||x == "+" ||x == "x" || x == "=" ){
      return true;
    }
    return false;
  }
  void equalPressed(){
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', "*");

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}