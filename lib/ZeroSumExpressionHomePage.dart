import 'package:flutter/material.dart';
import 'zerosum_expression.dart';





class ZeroSumExpressionHomePage extends StatefulWidget {
  @override
  _ZeroSumExpressionHomePageState createState() => _ZeroSumExpressionHomePageState();
}

class _ZeroSumExpressionHomePageState extends State<ZeroSumExpressionHomePage> {
  final TextEditingController _controller = TextEditingController();
  List<int>? _sequence;
  String? _error;
  List<String> _signs = [];

  void _generateSequence() {
    setState(() {
      _error = null;
      try {
        int n = int.parse(_controller.text);
        _sequence = generateSequence(n);
        _signs = List<String>.filled(n - 1, '');
      } catch (e) {
        _error = e.toString();
        _sequence = null;
      }
    });
  }

  void _evaluateExpression() {
    if (_sequence == null) return;

    int sum = _sequence![0];
    for (int i = 1; i < _sequence!.length; i++) {
      if (_signs[i - 1] == '+') {
        sum += _sequence![i];
      } else if (_signs[i - 1] == '-') {
        sum -= _sequence![i];
      }
    }

    if (sum == 0) {
      showDialog(
        barrierColor: Colors.black,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.blue,
          title: Text(
            'Correct!',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'You won!',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        barrierColor: Colors.black,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.red[500],
          title: Text(
            'Wrong!',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'You lose!',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'TRY AGAIN',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zero Sum Expression',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/white.jpg',),
              fit: BoxFit.cover,
            ),
          ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateSequence,
              child: Text('Generate Sequence'),
            ),
            SizedBox(height: 20),
            if (_error != null)
              Text(
                _error!,
                style: TextStyle(color: Colors.red),
              )
            else if (_sequence != null)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _sequence!.map((num) {
                      int index = _sequence!.indexOf(num);
                      return Row(
                        children: [
                          if (index > 0)
                            DropdownButton<String>(
                              value: _signs[index - 1],
                              items: ['', '+', '-']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _signs[index - 1] = newValue!;
                                });
                              },
                            ),
                          Text(num.toString()),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _evaluateExpression,
              child: Text('Evaluate Expression'),
            ),
          ],
        ),
      ),
    );
  }
}
