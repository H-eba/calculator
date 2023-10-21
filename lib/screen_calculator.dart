import 'package:flutter/material.dart';
import 'package:first_calculator/calculator_button.dart';
class CalculatoRscreen extends StatefulWidget {
  static String routeName='CalculatorScreen';


  @override
  State<CalculatoRscreen> createState() => _CalculatoRscreenState();
}

class _CalculatoRscreenState extends State<CalculatoRscreen> {
  String resultText='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator App'),),
      body: Column(children: [
       Expanded(child:
       Center(child:

          Container(width: double.infinity,
              margin: EdgeInsets.only(left: 15),
              child:
        Text( resultText
        ,style: TextStyle(fontSize: 25),)))),

    Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              CalculatorButton(digit: '7',onClik: onDigitClick,),
              CalculatorButton(digit:'8' ,onClik: onDigitClick,),
              CalculatorButton(digit:'9',onClik: onDigitClick,),
              CalculatorButton(digit: '+',onClik: onOperatorClick,),


            ],),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              CalculatorButton(digit: '4',onClik: onDigitClick,),
              CalculatorButton(digit: '5',onClik: onDigitClick,),
              CalculatorButton(digit: '6',onClik: onDigitClick,),
              CalculatorButton(digit: '-',onClik:onOperatorClick,),
            ],),
        ),
       
        Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              CalculatorButton(digit: '1',onClik: onDigitClick,),
              CalculatorButton(digit: '2',onClik: onDigitClick,),
              CalculatorButton(digit: '3',onClik: onDigitClick,),
              CalculatorButton(digit: '*',onClik:onOperatorClick ,),
          ],),
        ),

        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              CalculatorButton(digit: '.',onClik: onDigitClick,),
              CalculatorButton(digit: '0',onClik: onDigitClick,),
              CalculatorButton(digit: '=',onClik: onEqual,),
              CalculatorButton(digit: '/',onClik: onOperatorClick,),
          ],),
        ),

      ],)



    );
  }
  onDigitClick(String digit){
    //print('click button $digit');
    setState((){
     // resultText=digit;
      resultText+=digit;
    });

  }
  String operator='';
   String lhs='';
  onOperatorClick(String ClickOperator){
    if (operator.isEmpty){
      lhs=resultText;
      operator=ClickOperator;
      setState(() {
        resultText='';

      });

    }else{
     lhs =calculate(double.parse(lhs), operator, double.parse(resultText));
     operator=ClickOperator;
    }
     setState(() {
       resultText='';
     });


    print('lhs $lhs saved operator $operator');
  }
  String calculate(double lhs,String operator,double rhs){
    if (operator=='+'){
      return (lhs+rhs).toString();
    }else if(operator=='-'){
      return (lhs-rhs).toString();
    }
    else if(operator=='*'){
      return (lhs*rhs).toString();
    }else {
      return (lhs/rhs).toString();
    }

  }
  onEqual(){
    setState(() {
      resultText=calculate(double.parse(lhs), operator, double.parse(resultText));
    });
   lhs='';
   operator='';
  }
}

