import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String text ='0';
  double numOne = 0;
  double numTwo = 0;

  String result = '';
  String finalResult = '';
  String opr = '';
  String preOpr = '';
  @override

  Widget calculator(String btnText, Color textcolor, Color bgcolor) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: bgcolor,
        shape: CircleBorder(),
        padding: const EdgeInsets.all(20),
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        calculation(btnText);
      },
      child: Text(
        btnText,
        style: TextStyle(color: textcolor, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              width: 400,
              height: 200,
              child: Text(
               text,
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 400,
              height: 3,
              color: Colors.black12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      calculator('C', Colors.black, Colors.black54),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black54,
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                // numbers += '<-';
                              });
                            },
                            child: Text(
                              '<-',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      calculator('%', Colors.black, Colors.black54),
                      calculator('/', Colors.black, Colors.orangeAccent),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      calculator('7', Colors.black, Colors.black12),
                      calculator('8', Colors.black, Colors.black12),
                      calculator('9', Colors.black, Colors.black12),
                      calculator('*', Colors.black, Colors.orangeAccent),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      calculator('4', Colors.black, Colors.black12),
                      calculator('5', Colors.black, Colors.black12),
                      calculator('6', Colors.black, Colors.black12),
                      calculator('+', Colors.black, Colors.orangeAccent),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      calculator('1', Colors.black, Colors.black12),
                      calculator('2', Colors.black, Colors.black12),
                      calculator('3', Colors.black, Colors.black12),
                      calculator('-', Colors.black, Colors.orangeAccent),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, right: 25, left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black12,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextButton(
                            onPressed: () {
                              calculation('0');
                            },
                            child: Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black12,
                        ),
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            calculation('.');
                          },
                          child: Text(
                            '.',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.orangeAccent,
                        ),
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: TextButton(
                            onPressed: () {
                             calculation('=');
                            },
                            child: Text(
                              '=',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  void calculation(btnText) {
    if(btnText  == 'C') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == '*') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == '*' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == '*') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
      result = (numOne / 100) as String;
      finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

  }


  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

}
