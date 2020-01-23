import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController calcInput = TextEditingController();
  String input = '', num1 = '', num2 = '', op = '';
  var output = 'Result';
  double answer = 0;
  List<String> operators = ['+', '−', '×', '÷', '%'];
  List<String> numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'];

  onClick(String txt) {
    if (numbers.contains(txt)) {
      if (txt == '.' && input.contains('.')) {
        
      } else {
        input += txt; 
        setInput(txt);
      }  
    }
    // else if (operators.contains(txt)) {
    //   if (input.isNotEmpty && op.isEmpty) {
    //     num1 = input;
    //     input = '';
    //     setInput(txt);
    //     op = txt;
    //   }
    // }
    else if (operators.contains(txt) && op.isEmpty) {
      if (num1.isEmpty && input.isNotEmpty) {
        num1 = input;
        input = '';        
      }
      if (input.isEmpty && num1.isNotEmpty) {
        setInput(txt);
        op = txt;
      }
    }
    else if (txt == '=' && num1.isNotEmpty && op.isNotEmpty) {
      num2 = input;
      calculate(num1, num2, op);
      input = '';
    }
    else if(txt == 'C') {
      input = '';
      num1 = '';
      num2 = '';
      op = '';
      answer = 0;
      setState(() {
        calcInput.text = '';
        output = '0';
      });
    }
    else if (txt == 'DEL') {
      // if (op.isNotEmpty && input.isNotEmpty) 
      //   num2 = input;
      setState(() {
        if (calcInput.text.isNotEmpty) {
          calcInput.text = calcInput.text.substring(0, calcInput.text.length-1);
        }
      });
      if (input.isNotEmpty) {
        input = input.substring(0, input.length-1);
      }
      // if (num2.isNotEmpty) {
      //   num2 = num2.substring(0, num2.length-1);
      //   print(num2);
      // } 
      else if (op.isNotEmpty) {
        print(op);
        op = '';
        print(op);
      }
      else if (num1.isNotEmpty) {
        num1 = num1.substring(0, num1.length-1);
      }
    }
    // else if (txt == '+/−' && op.isEmpty && num2.isEmpty) {
    //   calculate('num1', num1, '−');
    // }
    // else if (txt = ) {
      
    // }
    // print(input);
  }

  calculate(n1, n2, o) {
    double fnum1 = double.parse(n1);
    double fnum2 = double.parse(n2);

    switch (o) {
      case '+':
        answer = fnum1 + fnum2;
        break;
      case '−':
        answer = fnum1 - fnum2;
        break;
      case '×':
        answer = fnum1 * fnum2;
        break;
      case '÷':
        answer = fnum1 / fnum2;
        break;
      case '%':
        answer = ((fnum1 / 100) * fnum2);
        break;
      default:
    }
    // print(output);
    num1  =  '';
    num2 = '';
    op = '';
    calcInput.text = '';
    setState(() {
      output = answer.toString();
    });
    answer = 0;
  }

  setInput(inp) {
    calcInput.text += inp;
  }

  Widget btn(String char, Color col) {
    Color txtColor = Colors.black;
    if (col == Colors.blueGrey[50]) {
      txtColor = Colors.deepOrange;
    } else if(col == Colors.deepOrange) {
      txtColor = Colors.white;
    }
    return Expanded( 
      child: MaterialButton(
        onPressed: () => onClick(char),
        child: Text(
          char,
          style: TextStyle(
            fontSize: 30,
            color: txtColor,          
          ),
        ),
        shape: BeveledRectangleBorder(side: BorderSide(width: 0.3, color: Colors.blueGrey[200])),
        color: col,
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[              
              Padding(padding: EdgeInsets.all(15)),
              Container(
                padding: EdgeInsets.only(right: 12),
                alignment: Alignment.topRight,
                child: Text(output, textAlign: TextAlign.end, style: TextStyle(fontSize: 20))
              ),
              TextField(
                controller: calcInput,
                scrollPadding: EdgeInsets.all(30),
                cursorColor: Colors.deepOrange,
                style: TextStyle(
                  height: 2,
                  fontSize: 40,
                  color: Colors.deepOrange,
                ),
                maxLines: 1,
                enabled: false,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
              ),
              Expanded( 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    btn('C', null),
                    btn('+/−', null),
                    btn('%', null),
                    btn('DEL', null)
                  ], 
                )
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    btn('7', null),
                    btn('8', null),
                    btn('9', null),
                    btn('÷', Colors.blueGrey[50])
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    btn('4', null),
                    btn('5', null),
                    btn('6', null),
                    btn('×', Colors.blueGrey[50])
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    btn('1', null),
                    btn('2', null),
                    btn('3', null),
                    btn('−', Colors.blueGrey[50])
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    btn('0', null),
                    btn('.', null),
                    btn('=', Colors.deepOrange),
                    btn('+', Colors.blueGrey[50])
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}