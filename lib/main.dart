import 'package:calculator/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalProvider(),
      child: MaterialApp(
        title: 'Calculator',
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black26,
                    elevation: 2,
                    fixedSize: const Size(80, 85),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))))),
        home: const CalculatorPage(),
      ),
    );
  }
}

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inputValue = Provider.of<CalProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
            child: Text(
              inputValue.result != 0 ? '${inputValue.result}' : '',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
            child: Text(
              inputValue.inputbool
                  ? '${inputValue.inputDoubleValue}'
                  : '${inputValue.inputValue}',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 55,
                color: Colors.white,
              ),
            ),
          ),
          Container(
              height: 600,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CalButton(text: 'AC', color: Colors.greenAccent),
                        const CalButton(text: '+/-', color: Colors.greenAccent),
                        const CalButton(text: '%', color: Colors.greenAccent),
                        CalButton(
                            text: String.fromCharCode(0x00F7),
                            color: Colors.redAccent),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalButton(text: '9', color: Colors.white),
                        CalButton(text: '8', color: Colors.white),
                        CalButton(text: '7', color: Colors.white),
                        CalButton(text: 'x', color: Colors.redAccent),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalButton(text: '6', color: Colors.white),
                        CalButton(text: '5', color: Colors.white),
                        CalButton(text: '4', color: Colors.white),
                        CalButton(text: '-', color: Colors.redAccent),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalButton(text: '1', color: Colors.white),
                        CalButton(text: '2', color: Colors.white),
                        CalButton(text: '3', color: Colors.white),
                        CalButton(text: '+', color: Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalButton(
                            text: String.fromCharCode(0x27F3),
                            color: Colors.white),
                        const CalButton(text: '0', color: Colors.white),
                        const CalButton(text: '.', color: Colors.white),
                        const CalButton(text: '=', color: Colors.redAccent),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class CalButton extends StatelessWidget {
  final String text;
  final Color color;
  const CalButton({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CalProvider>(context);
    return ElevatedButton(
      onPressed: () {
        if (['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].contains(text)) {
          value.value(int.parse(text));
        }
        if (text == 'AC') {
          value.ac();
        }
        if (text == '+/-') {
          value.postivenegative();
        }
        if (text == '%') {
          value.percentage();
        }
        if (['%', 'x', '-', '+'].contains(text)) {
          value.operation(text);
        }
      },
      child: Text(
        text,
        style:
            TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
