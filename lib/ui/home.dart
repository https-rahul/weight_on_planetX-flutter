import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";

  /*
  Mercury: 0.38
  Venus: 0.91
  Earth: 1.00
  Mars: 0.38
  Jupiter: 2.34
  Saturn: 1.06
  Uranus: 0.92
  Neptune: 1.19
  Pluto: 0.06 */

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText =
              "Your weight on Mercury is ${_finalResult.toStringAsFixed(3)} kgs";
          break;

        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText =
              "Your weight on Venus is ${_finalResult.toStringAsFixed(3)} kgs";

          break;

        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText =
              "Your weight on Mars is ${_finalResult.toStringAsFixed(3)} kgs";

          break;

        case 3:
          _finalResult = calculateWeight(_weightController.text, 2.34);
          _formattedText =
              "Your weight on Jupiter is ${_finalResult.toStringAsFixed(3)} kgs";

          break;

        case 4:
          _finalResult = calculateWeight(_weightController.text, 1.06);
          _formattedText =
              "Your weight on Saturn is ${_finalResult.toStringAsFixed(3)} kgs";

          break;

        case 5:
          _finalResult = calculateWeight(_weightController.text, 0.92);
          _formattedText =
              "Your weight on Uranus is ${_finalResult.toStringAsFixed(3)} kgs";

          break;

        case 6:
          _finalResult = calculateWeight(_weightController.text, 1.19);
          _formattedText =
              "Your weight on Neptune is ${_finalResult.toStringAsFixed(3)} kgs";

          break;

        case 7:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText =
              "Your weight on Pluto is ${_finalResult.toStringAsFixed(3)} kgs";

          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Weight on planet X"),
          centerTitle: true,
          backgroundColor: Colors.black38,
        ),
        backgroundColor: Colors.white70,
        body: new Container(
          alignment: Alignment.topCenter,
          child: new ListView(
            padding: const EdgeInsets.all(2.5),
            children: <Widget>[
              new Image.asset(
                'images/planet.png',
                height: 133.0,
                width: 200.0,
              ),
              new Container(
                  margin: const EdgeInsets.all(3.0),
                  alignment: Alignment.center,
                  child: new Column(
                    children: <Widget>[
                      new TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          labelText: 'Your weight on Earth',
                          hintText: 'in kgs',
                          icon: new Icon(Icons.av_timer),
                        ),
                      ),

                      new Padding(padding: EdgeInsets.all(5.0)),

                      // radio buttons
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio<int>(
                              value: 0,
                              activeColor: Colors.cyan,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text(
                            "Mercury",
                            style: new TextStyle(color: Colors.black),
                          ),
                          new Radio<int>(
                              value: 1,
                              activeColor: Colors.cyan,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text(
                            "Venus",
                            style: new TextStyle(color: Colors.black),
                          ),
                          new Radio<int>(
                              value: 2,
                              activeColor: Colors.cyan,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text(
                            "Mars",
                            style: new TextStyle(color: Colors.black),
                          ),
                          new Radio<int>(
                              value: 3,
                              activeColor: Colors.cyan,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text(
                            "Jupiter",
                            style: new TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio<int>(
                              value: 4,
                              activeColor: Colors.cyan,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text(
                            "Saturn",
                            style: new TextStyle(color: Colors.black),
                          ),
                          new Radio<int>(
                              value: 5,
                              activeColor: Colors.cyan,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text(
                            "Uranus",
                            style: new TextStyle(color: Colors.black),
                          ),
                          new Radio<int>(
                              value: 6,
                              activeColor: Colors.cyan,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text(
                            "Neptune",
                            style: new TextStyle(color: Colors.black),
                          ),
                          new Radio<int>(
                              value: 7,
                              activeColor: Colors.cyan,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text(
                            "Pluto",
                            style: new TextStyle(color: Colors.black),
                          ),
                        ],
                      ),

                      new Padding(padding: EdgeInsets.all(16.5)),

                      //weight display
                      new Text(
                        _weightController.text.isEmpty
                            ? "Please enter your weight"
                            : "$_formattedText",
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong!");
      return int.parse("180") * 0.0;
    }
  }
}
