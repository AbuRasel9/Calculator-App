import 'package:calculator/view/widget/calculation_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    // used to check if the result contains a decimal
    String doesContainDecimal(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
      }
      return result;
    }

    setState(() {
      if (buttonText == "AC") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "+/-") {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '%');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if (expression.contains('%')) {
            result = doesContainDecimal(result);
          }
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("-------e$equation");
    print("-------e$result");
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.orange,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "DEG",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //equation and result
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          equation,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.orange,
                            size: 23,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  result,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                  onPressed: () =>buttonPressed("⌫") ,
                  icon: const Icon(
                    Icons.backspace_outlined,
                    color: Colors.orange,
                    size: 23,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CalculationButton(
                  onTap: () => buttonPressed(
                    "AC",
                  ),
                  buttonColor: Colors.white10,
                  buttonText: "AC",
                ),
                CalculationButton(
                  onTap: () => buttonPressed(
                    "%",
                  ),
                  buttonColor: Colors.white10,
                  buttonText: "%",
                ),
                CalculationButton(
                  onTap: () => buttonPressed(
                    "÷",
                  ),
                  buttonColor: Colors.white10,
                  buttonText: "÷",
                ),
                CalculationButton(
                  onTap: () => buttonPressed(
                    "×",
                  ),
                  buttonColor: Colors.white10,
                  buttonText: "×",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculationButton(
                  onTap:()=> buttonPressed("7"),
                  buttonColor: Colors.white24,
                  buttonText: "7",
                ),
                CalculationButton(
                  onTap:()=> buttonPressed("8"),
                  buttonColor: Colors.white24,
                  buttonText: "8",
                ),
                CalculationButton(
                  onTap:()=> buttonPressed("9"),
                  buttonColor: Colors.white24,
                  buttonText: "9",
                ),
                CalculationButton(
                  onTap:()=> buttonPressed("-"),
                  buttonColor: Colors.white10,
                  buttonText: "-",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculationButton(
                  onTap:()=> buttonPressed("4"),
                  buttonColor: Colors.white24,
                  buttonText: "4",
                ),
                CalculationButton(
                  onTap:()=> buttonPressed("5"),
                  buttonColor: Colors.white24,
                  buttonText: "5",
                ),
                CalculationButton(
                  onTap:()=> buttonPressed("6"),
                  buttonColor: Colors.white24,
                  buttonText: "6",
                ),
                CalculationButton(
                  onTap:()=> buttonPressed("-"),
                  buttonColor: Colors.white10,
                  buttonText: "+",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CalculationButton(
                          onTap:()=> buttonPressed("1"),
                          buttonColor: Colors.white24,
                          buttonText: "1",
                        ),
                        CalculationButton(
                          onTap:()=> buttonPressed("2"),
                          buttonColor: Colors.white24,
                          buttonText: "2",
                        ),
                        CalculationButton(
                          onTap:()=> buttonPressed("3"),
                          buttonColor: Colors.white24,
                          buttonText: "3",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CalculationButton(
                          onTap:()=> buttonPressed("+/-"),
                          buttonColor: Colors.white24,
                          buttonText: "+/-",
                        ),
                        CalculationButton(
                          onTap:()=> buttonPressed("0"),
                          buttonColor: Colors.white24,
                          buttonText: "0",
                        ),
                        CalculationButton(
                          onTap: ()=>buttonPressed("."),
                          buttonColor: Colors.white24,
                          buttonText: ".",
                        ),
                      ],
                    ),
                  ],
                ),
                CalculationButton(
                  onTap:()=> buttonPressed("="),
                  buttonColor: Colors.orange,
                  buttonText: "=",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
