import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.white),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var Weight = 60.0;
  var Height = 160.0;
  var bmi = 0.0;
  var result = '';

  void calculateBMI() {
    bmi = Weight / ((Height / 100) * (Height / 100));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                child: Container(
                  width: 170,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Weight (Kgs)',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        '$Weight',
                        style: TextStyle(fontSize: 40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Weight--;
                              setState(() {});
                            },
                            child: Text(
                              '-',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Weight++;
                              setState(() {});
                            },
                            child: Text(
                              '+',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Container(
                  width: 170,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Height (cm)',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        '${Height.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 40),
                      ),
                      Slider(
                          thumbColor: Colors.white,
                          activeColor: Colors.white,
                          value: Height,
                          min: 100,
                          max: 250,
                          onChanged: (newValue) {
                            Height = newValue;
                            setState(() {});
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 200,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                calculateBMI();
                result = '${bmi.toStringAsFixed(2)}';
              },
              child: Text(
                'Calculate BMI',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              width: 500,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 50),
                  ),
                  Text(
                    result,
                    style: (bmi >= 18 && bmi <= 24)
                        ? TextStyle(fontSize: 80, color: Colors.green)
                        : (bmi < 18)
                            ? TextStyle(fontSize: 80, color: Colors.orange)
                            : TextStyle(fontSize: 80, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
