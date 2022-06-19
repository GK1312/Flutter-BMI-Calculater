import 'package:flutter/material.dart';
import 'package:bmi/constant/constants.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:bmi/widgets/left_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double h = double.parse(_heightController.text);
                double w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = w / (h * h);
                  if (_bmiResult > 25) {
                    _textResult = "You're overweight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You have normal weight";
                  } else {
                    _textResult = "You're underweight";
                  }
                });
              },
              child: Container(
                child: Text(
                  "Calculate your BMI",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: accentHexColor,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LeftBar(
              barWidth: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(
              barWidth: 70,
            ),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(
              barWidth: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            const RightBar(
              barWidth: 40,
            ),
            const SizedBox(
              height: 50,
            ),
            const RightBar(
              barWidth: 40,
            ),
          ],
        ),
      ),
    );
  }
}
