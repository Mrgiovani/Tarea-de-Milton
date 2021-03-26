import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SliderChecksPage extends StatefulWidget {
  SliderChecksPage({Key key}) : super(key: key);

  @override
  _SliderCheckPageState createState() => _SliderCheckPageState();
}

class _SliderCheckPageState extends State<SliderChecksPage> {
  double _limite = 20;
  double tam = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Slider-Checks'),
      ),
      body: _inputElements(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _inputElements(BuildContext context) => ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          Text('Slider'),
          Divider(),
          _slider(),
          Divider(),
          _slider2(),
          Divider(),
          Text('CheckBox'),
          _checks(),
          Divider(),
          _checks2(),
          Divider(),
        ],
      );

  Widget _slider() => Slider(
        value: _limite,
        min: 0,
        max: 200,
        divisions: 20,
        label: _limite.round().toString(),
        onChanged: (value) {
          setState(() {
            _limite = value;
          });
        },
      );

  Widget _checks() => CheckboxListTile(
      title: const Text('Ejemplo 1 marcar la casilla '),
      value: timeDilation != 1.0,
      onChanged: (bool value) {
        setState(() {
          if (value) {
            timeDilation = 2.0;
          } else {
            timeDilation = 1.0;
          }
        });
      },
      secondary: const Icon(Icons.assignment_turned_in));

  RangeValues _Rango = const RangeValues(10, 100);
  Widget _slider2() {
    return RangeSlider(
      values: _Rango,
      min: 0,
      max: 100,
      divisions: 10,
      labels: RangeLabels(
        _Rango.start.round().toString(),
        _Rango.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _Rango = values;
        });
      },
    );
  }
  bool _checked = true; 
  Widget _checks2() => CheckboxListTile(
      title:  Text('Color'),
      secondary: Icon(Icons.color_lens),
      controlAffinity: ListTileControlAffinity.platform,
      value: _checked,
      onChanged: (bool value) {
        setState(() {
          _checked = value;
        });
      },
      activeColor: Colors.purple,
      checkColor: Colors.black,
      );
}
