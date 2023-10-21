import 'package:flutter/material.dart';
class CalculatorButton extends StatelessWidget {
   String digit;
   Function onClik;
   CalculatorButton({ required this.digit,required this.onClik});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(2),
            child:
        ElevatedButton(onPressed:  (){
           if (digit=='='){
             onClik();
           }else{
             onClik(digit);
           }

        }, child: Text('$digit',style: TextStyle(
          backgroundColor: Colors.blue,fontSize: 25,fontWeight: FontWeight.bold,
        ),))))
    ;
  }
}
