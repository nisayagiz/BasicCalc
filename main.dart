import 'package:flutter/material.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCalculator(),
    );
  }
}


class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {

  double result = 0.0;
  String strResult = '';
  String operator = '';
  double firstNumber = 0.0;

  void onDigitPress(String text){
    print("Digit pressed $text");

    if(text == '+') {
      operator = text;
      firstNumber = result;
      strResult = '';
      setState(() {
        result = 0;
      });
    }
    else if(text == '-'){
      operator = text;
      firstNumber = result;
      strResult = '';
      setState(() {
        result = 0;
      });
    }
    else if(text == 'C'){
      setState(() {
        firstNumber = 0.0;
        result = 0;
      });
      strResult = '';
    }
    else if(text == 'd'){


    }
    else if(text == '÷'){
      operator = text;
      firstNumber = result;
      strResult = '';
      setState(() {
        result = 0;
      });
    }
    else if(text == 'x'){


    }
    else if(text == '='){
      switch (operator) {
        case '+' :
          setState(() {
            result += firstNumber;
          });
          strResult = '$result';
          break;

        case '-':
          setState(() {
            result = firstNumber - result;
          });
          strResult = '$result';
          break;

      }

    }
    else{
      var tempResult = strResult + text;
      var temp = double.tryParse(tempResult);
      if(temp != null){
        strResult = tempResult;
        setState(() {
          result = temp;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Calculator"),
      ),

      body: Container(
        color: Colors.white12,
        child: Column(
          children: [
            Expanded(
              flex: 1,

                child: Container(
                  alignment: Alignment.centerRight,

                    child: Text(
                      '$result',
                      style: TextStyle(
                        fontSize: 60,
                      ),

                    )
                )
            ),

            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 2,
                          child: RaisedButton(onPressed: (){
                            onDigitPress('C');
                          },

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  )
                              ),

                              color: Colors.black26,

                              child: Text(
                                'C',
                                style: TextStyle(fontSize: 33, color: Colors.white),
                              )
                          ),

                        ),

                        //buildCalcButton('C', Colors.black26),
                        buildCalcButton('dlt', Colors.black26),
                        buildCalcButton('÷', Colors.black26),
                      ],
                    ),
                  ),



                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildCalcButton('7', Colors.black26),
                        buildCalcButton('8', Colors.black26),
                        buildCalcButton('9', Colors.black26),
                        buildCalcButton('x', Colors.black26),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildCalcButton('4', Colors.black26),
                        buildCalcButton('5', Colors.black26),
                        buildCalcButton('6', Colors.black26),
                        buildCalcButton('+', Colors.black26),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildCalcButton('1', Colors.black26),
                        buildCalcButton('2', Colors.black26),
                        buildCalcButton('3', Colors.black26),
                        buildCalcButton('-', Colors.black26),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildCalcButton('.', Colors.black26),
                        buildCalcButton('0', Colors.black26),
                        buildCalcButton('00', Colors.black26),
                        buildCalcButton('=', Colors.black26),

                      ],
                    ),
                  ),
                ],
              ),
            )

          ]
        )
      )
    );
  }

  Expanded buildCalcButton(String text, Color color) {
    return Expanded(
      child: RaisedButton(onPressed: (){
        onDigitPress(text);
      },

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.white,
          style: BorderStyle.solid,
          width: 1,
        )
      ),

      color: color,

        child: Text(
          text,
          style: TextStyle(fontSize: 33, color: Colors.white),
        )
      ),
    );
  }
}