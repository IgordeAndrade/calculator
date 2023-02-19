import 'package:app_calculadora/list.dart';
import 'package:flutter/material.dart';
import 'create_button.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    String visor = '0';

    void setValue(String value) {
      if (visor == '0') {
        setState(
          () {
            visor = value;
          },
        );
      } else {
        setState(
          () {
            visor = (visor + value);
          },
        );
      }
    }

    void reset() {
      setState(() {
        visor = '0';
      });
    }

    void result() {
      Parser parser = Parser();
      Expression expression = parser.parse(visor);
      double result = expression.evaluate(EvaluationType.REAL, ContextModel());
      setState(() {
        visor = result.toString();
      });
    }

    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 3, 3),
        title: const Text(
          'Calculadora',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.13,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Center(
              child: Text(
                visor,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                  firstList.length,
                  (index) => DigitButton(
                    caracter: firstList[index],
                    onPressed: () => setValue(firstList[index]),
                    color: listColors.last,
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  secondList.length,
                  (index) => DigitButton(
                    caracter: secondList[index],
                    onPressed: () => setValue(secondList[index]),
                    color: secondList[index] == secondList.last
                        ? listColors.last
                        : listColors.first,
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  thirdList.length,
                  (index) => DigitButton(
                    caracter: thirdList[index],
                    onPressed: () => setValue(thirdList[index]),
                    color: thirdList[index] == thirdList.last
                        ? listColors.last
                        : listColors.first,
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  fortyList.length,
                  (index) => DigitButton(
                    caracter: fortyList[index],
                    onPressed: () => setValue(fortyList[index]),
                    color: fortyList[index] == fortyList.last
                        ? listColors.last
                        : listColors.first,
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  fiftyList.length,
                  (index) => DigitButton(
                    caracter: fiftyList[index],
                    onPressed: () => setValue(fiftyList[index]),
                    color: fiftyList[index] == fiftyList.last
                        ? listColors.last
                        : listColors.first,
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
