import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int firstnum = 0;
  late int secondnum = 0;
  String texttodisplay = "";
  late String res;
  late String operatortoperform = "+";

  void btnclick(String btnval) {
    if (btnval == "C") {
      texttodisplay = "";
      operatortoperform = "+";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperform == "x") {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperform == "/") {
        res = (firstnum / secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }
  
//custom button start

  Widget custombutton(String btnval) {
    return Expanded(
        child: OutlinedButton(
      onPressed: () => btnclick(btnval),
      //button style
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
      ),

      child: Text(
        btnval,
        style: const TextStyle(
          fontSize: 25.0,
          color: Colors.redAccent,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          //new

          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.bottomRight,

            //result print here
            child: Text(
              firstnum.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          //end

          //start oparetor

          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.bottomRight,

            //result print here
            child: Text(
              operatortoperform,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),

          //end oparetor

          //new

          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.bottomRight,

            //result print here
            child: Text(
              secondnum.toString(),
              style: const TextStyle(
                color: Colors.pinkAccent,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          //end

          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.bottomRight,

            //result print here
            child: Text(
              texttodisplay,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),

          Row(
            children: <Widget>[
              custombutton("9"),
              custombutton("8"),
              custombutton("7"),
              custombutton("+"),
            ],
          ),
          //another row
          Row(
            children: <Widget>[
              custombutton("6"),
              custombutton("5"),
              custombutton("4"),
              custombutton("-"),
            ],
          ),
          //another row
          Row(
            children: <Widget>[
              custombutton("3"),
              custombutton("2"),
              custombutton("1"),
              custombutton("x"),
            ],
          ),
          //another row
          Row(
            children: <Widget>[
              custombutton("C"),
              custombutton("0"),
              custombutton("="),
              custombutton("/"),
            ],
          ),
        ],
      ),
    );
  }
}
