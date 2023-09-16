import 'package:flutter/material.dart';
import 'common_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String _text = '';

  void _addNumber(int number) {
    setState(() {
      if (_text == '0') {
        _text = '$number';
      } else {
        _text = '$_text$number';
      }
    });
  }

  void _addArithmetic(String action) {
    setState(() {
      _text = '$_text$action';
    });
  }

  void _calculate() {
    if (_text.contains('+')) {
      /// '784983+4873857
      double firstNumber = double.parse(_text.substring(0, _text.indexOf('+')));
      double secondNumber =
      double.parse(_text.substring(_text.indexOf('+') + 1, _text.length));
      setState(() {
        _text = '${firstNumber + secondNumber}';
      });
    } else if (_text.contains('-')) {
      double firstNumber = double.parse(_text.substring(0, _text.indexOf('-')));
      double secondNumber =
      double.parse(_text.substring(_text.indexOf('-') + 1, _text.length));
      setState(() {
        _text = '${firstNumber - secondNumber}';
      });
    } else if (_text.contains('/')) {
      double firstNumber = double.parse(_text.substring(0, _text.indexOf('/')));
      double secondNumber =
      double.parse(_text.substring(_text.indexOf('/') + 1, _text.length));
      setState(() {
        _text = '${firstNumber / secondNumber}';
      });
    } else if (_text.contains('*')) {
      double firstNumber = double.parse(_text.substring(0, _text.indexOf('*')));
      double secondNumber =
      double.parse(_text.substring(_text.indexOf('*') + 1, _text.length));
      setState(() {
        _text = '${firstNumber * secondNumber}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              height: 85,
              width: 400,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Text(
                _text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 70),
            Row(
              children: [
                CommonButton(
                  text: '7',
                  onTap: () {
                    _addNumber(7);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CommonButton(
                  text: '8',
                  onTap: () {
                    _addNumber(8);
                  },
                ),
                const SizedBox(width: 10),
                CommonButton(
                  text: '9',
                  onTap: () {
                    _addNumber(9);
                  },
                ),
                const SizedBox(width: 10),
                CommonButton(
                  text: '/',
                  onTap: () {
                    _addArithmetic('/');
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CommonButton(
                  text: '4',
                  onTap: () {
                    _addNumber(4);
                  },
                ),
                const SizedBox(width: 10),
                CommonButton(
                  text: '5',
                  onTap: () {
                    _addNumber(5);
                  },
                ),
                const SizedBox(width: 10),
                CommonButton(
                  text: '6',
                  onTap: () {
                    _addNumber(6);
                  },
                ),
                const SizedBox(width: 10),
                CommonButton(
                  text: '*',
                  onTap: () {
                    _addArithmetic('*');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CommonButton(
                  text: '1',
                  onTap: () {
                    _addNumber(1);
                  },
                ),
                const SizedBox(width: 10),
                CommonButton(
                  text: '2',
                  onTap: () {
                    _addNumber(2);
                  },
                ),
                const SizedBox(width: 10),
                CommonButton(
                  text: '3',
                  onTap: () {
                    _addNumber(3);
                  },
                ),
                const SizedBox(width: 10),
                CommonButton(
                  text: '-',
                  onTap: () {
                    _addArithmetic('-');
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CommonButton(
                  text: '.',
                  onTap: () {
                    _addArithmetic('.');
                  },
                ),
                const SizedBox(width: 10),
                CommonButton(
                  text: '0',
                  onTap: () {
                    _addNumber(0);
                  },
                ),
                const SizedBox(width: 10),
                CommonButton(
                  text: 'CLR',
                  onTap: () {
                    setState(() {
                      _text = '0';
                    });
                  },
                ),
                const SizedBox(width: 10),
                CommonButton(
                  text: '+',
                  onTap: () {
                    _addArithmetic('+');
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(400, 60),
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                _calculate();
              },
              child: const Text(
                '=',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 34,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
