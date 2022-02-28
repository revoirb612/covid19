import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'by 홍토끼쌤',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '2022 범어초등학교 오미크론 대응 상황판'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List a11 = ["미입력", "0", "0", "0", "0", "미입력"]; // 재적수, 확진자 수, 등교중지 수, 일반 결석 수
  List a12 = ["미입력", "0", "0", "0", "0", "미입력"];
  List a21 = ["미입력", "0", "0", "0", "0", "미입력"];
  List a22 = ["미입력", "0", "0", "0", "0", "미입력"];
  List a31 = ["미입력", "0", "0", "0", "0", "미입력"];
  List a41 = ["미입력", "0", "0", "0", "0", "미입력"];
  List a51 = ["미입력", "0", "0", "0", "0", "미입력"];
  List a52 = ["미입력", "0", "0", "0", "0", "미입력"];
  List a61 = ["미입력", "0", "0", "0", "0", "미입력"];

  // 개별 입력
  String str1 = '0';
  String str2 = '0';
  String str3 = '0';
  String str4 = '0';
  String str5 = '0';
  String str6 = '0';

  int sch2 = 177;
  int sch3 = 0;  // 확진자 수
  int sch4 = 0;  // 등교중지 수
  int sch5 = 0;  // 일반결석 수
  double sch6 = 0;  // 확진자 비율
  double sch7 = 0;  // 등교중지 비율
  String sch8 = "";

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

  void _incrementCounter() {
    setState(() {
      str1 = controller1.text;
      str2 = controller2.text;
      str3 = controller3.text; // 확진자 수
      str4 = controller4.text; // 등교중지 수
      str5 = controller5.text; // 일반결석 수
      str6 = controller6.text;

      if (controller1.text == "1-1") {
        a11 = [str1, str2, str3, str4, str5, str6];
      } else if (controller1.text == "1-2") {
        a12 = [str1, str2, str3, str4, str5, str6];
      } else if (controller1.text == "2-1") {
        a21 = [str1, str2, str3, str4, str5, str6];
      } else if (controller1.text == "2-2") {
        a22 = [str1, str2, str3, str4, str5, str6];
      } else if (controller1.text == "3-1") {
        a31 = [str1, str2, str3, str4, str5, str6];
      } else if (controller1.text == "4-1") {
        a41 = [str1, str2, str3, str4, str5, str6];
      } else if (controller1.text == "5-1") {
        a51 = [str1, str2, str3, str4, str5, str6];
      } else if (controller1.text == "5-2") {
        a52 = [str1, str2, str3, str4, str5, str6];
      } else if (controller1.text == "6-1") {
        a61 = [str1, str2, str3, str4, str5, str6];
      }


      // 전체 확진자 수 구하기
      sch3 = int.parse(a11[2]) + int.parse(a12[2]) + int.parse(a21[2]) + int.parse(a22[2]) + int.parse(a31[2]) + int.parse(a41[2]) + int.parse(a51[2]) + int.parse(a52[2]) + int.parse(a61[2]);
      // 전체 등교중지 수 구하기
      sch4 = int.parse(a11[3]) + int.parse(a12[3]) + int.parse(a21[3]) + int.parse(a22[3]) + int.parse(a31[3]) + int.parse(a41[3]) + int.parse(a51[3]) + int.parse(a52[3]) + int.parse(a61[3]);
      // 전체 일반결석 수 구하기
      sch5 = int.parse(a11[4]) + int.parse(a12[4]) + int.parse(a21[4]) + int.parse(a22[4]) + int.parse(a31[4]) + int.parse(a41[4]) + int.parse(a51[4]) + int.parse(a52[4]) + int.parse(a61[4]);
      // 확진자 비율 구하기
      sch6 = sch3 / (sch2 - sch5) * 100;
      // 등교중지 비율 구하기
      sch7 = sch4 / (sch2 - sch5) * 100;

      if (sch6 > 3 && sch7 > 15) {
        sch8 = "전면 원격 수업으로 전환합니다.";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 750,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('▶ 금일 학교현황 및 대응요령', style: TextStyle(fontSize: 30),),
                      ),
                      Display("🌳  전체 학생 수: ", sch2.toString()),
                      Display("🌳  확진자 수: ", sch3.toString()),
                      Display("🌳  등교중지 수: ", sch4.toString()),
                      Display("🌳  일반결석 수: ", sch5.toString()),
                      Display("🌳  학교 단위 확진자 비율: ", sch6.toStringAsFixed(2)+"%"),
                      Display("🌳  학교 단위 등교중지 비율: ", sch7.toStringAsFixed(2)+"%"),
                      Display("🌳  대응방침: ", sch8),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 750,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('▶ 금일 입력현황', style: TextStyle(fontSize: 30)),
                      ),
                      Display("🌳 1-1\t", a11.toString() + " 원격 수업 전환 요망"),
                      Display("🌳 1-2\t", a12.toString() + ""),
                      Display("🌳 2-1\t", a21.toString() + ""),
                      Display("🌳 2-2\t", a22.toString() + ""),
                      Display("🌳 3-1\t", a31.toString() + ""),
                      Display("🌳 4-1\t", a41.toString() + ""),
                      Display("🌳 5-1\t", a51.toString() + ""),
                      Display("🌳 5-2\t", a52.toString() + ""),
                      Display("🌳 6-1\t", a61.toString() + ""),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 750,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('▶ 담임 입력 항목(10시 이전까지 입력)', style: TextStyle(fontSize: 30)),
                          ),
                          Input("학반(예시 5-2)", TextInputType.text, controller1),
                          Input("재적 수", TextInputType.text, controller2),
                          Input("확진자 수", TextInputType.text, controller3),
                          Input("등교중지 수(확진자 수 + 자가격리자 수)", TextInputType.text, controller4),
                          Input("일반 결석 수", TextInputType.text, controller5),
                          Input("학생별 사유 작성(예시 없음, 홍승일(꾀병) 등)", TextInputType.text, controller6),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _incrementCounter();
                          },
                          child: const Text("입력 및 수정하기"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Input extends StatelessWidget {
  final String name;
  final TextInputType type;
  final TextEditingController _controller;

  const Input(this.name, this.type, this._controller, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: name),
      keyboardType: type,
      controller: _controller,
    );
  }
}

class Display extends StatelessWidget {
  final String name;
  final String data;

  const Display(this.name, this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          name,
          style: const TextStyle(fontSize: 18,),
        ),
        Text(
          data,
          style: const TextStyle(fontSize: 18,),
        ),
      ],
    );
  }
}
