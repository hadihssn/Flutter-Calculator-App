import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorApp(),
    ),
  );
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

  //value to which input will be appended
  double inputValue = 0;
  double previousInputValue = 0;
  String operatorPressed = '';

  //button pressed on calculator
  String pressedButton = '';

  //String will be placed over here
  String inputDisplay = '';
  //String to be displayed
  String outDisplay = '';

  String buildStringChByCh = '';
  String value1Build = '';
  double printValue = 0;

  void onButtonPress2(String valuePressed) {

    setState(() {});

    if (valuePressed == '1' || valuePressed == '2' || valuePressed == '3' || valuePressed == '4' || valuePressed == '5' || valuePressed == '6' || valuePressed == '7' || valuePressed == '8' || valuePressed == '9' || valuePressed == '0' || valuePressed == '+' || valuePressed == '-' || valuePressed == '*' || valuePressed == '/') {

      if(inputDisplay != '' && outDisplay != ''){
        inputValue = 0;
        previousInputValue = 0;
        operatorPressed = '';
        inputDisplay = '';
        outDisplay = '';
        buildStringChByCh = '';
        value1Build = '';
        printValue = 0;
      }

    buildStringChByCh = buildStringChByCh + valuePressed;
    inputDisplay = buildStringChByCh;
    }

    else if (valuePressed == '=') {
      for (var c in buildStringChByCh.runes) {

        var ch = String.fromCharCode(c);    //Ch is getting characters one by one
        print("Value from expression is: " + ch);


        if(ch == '1' || ch == '2' || ch == '3' || ch == '4' || ch == '5' || ch == '6' || ch == '7' || ch == '8' || ch == '9' || ch == '0'){
          value1Build = value1Build + ch;
          print("Value 1 is: " + value1Build);
        }

        if(previousInputValue != 0){
          if(operatorPressed == '+'){
            printValue = previousInputValue + int.parse(value1Build);
            outDisplay = printValue.toString();
            if(outDisplay.endsWith('.0')){
              outDisplay = outDisplay.substring(0, outDisplay.length - 2);
            }
          }
          else if(operatorPressed == '-'){
            printValue = previousInputValue - int.parse(value1Build);
            outDisplay = printValue.toString();
            if(outDisplay.endsWith('.0')){
              outDisplay = outDisplay.substring(0, outDisplay.length - 2);
            }
          }
          else if(operatorPressed == '*'){
            printValue = previousInputValue * int.parse(value1Build);
            outDisplay = printValue.toString();
            if(outDisplay.endsWith('.0')){
              outDisplay = outDisplay.substring(0, outDisplay.length - 2);
            }
          }
          else if(operatorPressed == '/'){
            printValue = previousInputValue / int.parse(value1Build);
            outDisplay = printValue.toString();
            if(outDisplay.endsWith('.0')){
              outDisplay = outDisplay.substring(0, outDisplay.length - 2);
            }
          }
        }

        if(ch == '+' || ch == '-' || ch == '*' || ch == '/'){

          if(outDisplay != ''){
            previousInputValue = double.parse(outDisplay);
          }
          else{
            previousInputValue = double.parse(value1Build);
          }
          print("Previous input value is: " + previousInputValue.toString());
          operatorPressed = ch;
          value1Build = '';
        }
      }
    }

    else if (valuePressed == 'AC') {
      inputValue = 0;
      previousInputValue = 0;
      operatorPressed = '';
      inputDisplay = '';
      outDisplay = '';
      buildStringChByCh = '';
      value1Build = '';
      printValue = 0;
    }

    else if (valuePressed == '<') {
      buildStringChByCh = buildStringChByCh.substring(0, buildStringChByCh.length - 1);
      inputDisplay = buildStringChByCh;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      //App Bar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text("Calculator App"),
        ),
      ),

      //Body
      body: Column(
        children: [
          //Input Output Area
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              color: Colors.grey[900],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Input Area
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: Text(
                      inputDisplay,
                      style: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  //Output Area
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
                    child: Text(
                      outDisplay,
                      style: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Buttons
          //Row 1
          Row(
            children: [
              //Button 1
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '7';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("7"),
                  ),
                ),
              ),

              //Button 2
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '8';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("8"),
                  ),
                ),
              ),

              //Button 3
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '9';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("9"),
                  ),
                ),
              ),

              //Button 4
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '/';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("/"),
                  ),
                ),
              ),
            ],
          ),

          //Row 2
          Row(
            children: [
              //Button 1
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '4';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("4"),
                  ),
                ),
              ),

              //Button 2
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '5';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("5"),
                  ),
                ),
              ),

              //Button 3
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '6';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("6"),
                  ),
                ),
              ),

              //Button 4
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '*';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("*"),
                  ),
                ),
              ),
            ],
          ),

          //Row 3
          Row(
            children: [
              //Button 1
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '1';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("1"),
                  ),
                ),
              ),

              //Button 2
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '2';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("2"),
                  ),
                ),
              ),

              //Button 3
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '3';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("3"),
                  ),
                ),
              ),

              //Button 4
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '-';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("-"),
                  ),
                ),
              ),
            ],
          ),

          //Row 4
          Row(
            children: [
              //Button 1
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '0';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("0"),
                  ),
                ),
              ),

              //Button 2
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '<';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("<-"),
                  ),
                ),
              ),

              //Button 3
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = 'AC';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("AC"),
                  ),
                ),
              ),

              //Button 4
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '+';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("+"),
                  ),
                ),
              ),
            ],
          ),

          //Row 5
          Row(
            children: [
              //Button 1
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      pressedButton = '=';
                      onButtonPress2(pressedButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text("="),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
