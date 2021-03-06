import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DatePickerSample',
      home: Scaffold(
        appBar: AppBar(
          title: Text('DatePickerSample'),
        ),
        body: Center(
          child: DatePicker(),
        ),
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  // 現在日時
  DateTime _date = new DateTime.now();

  // ボタン押下時のイベント
  void onPressedRaisedButton() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2020),
        lastDate: new DateTime.now().add(new Duration(days: 360)));

    if (picked != null) {
      // 日時反映
      setState(() => _date = picked);
    }
  }

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          children: <Widget>[
            // 日時表示部分
            Center(child: Text("${_date}")),
            // DatePicker表示ボタン。
            new ElevatedButton(
              onPressed: () =>
                  // 押下時のイベントを宣言。
                  onPressedRaisedButton(),
              child: new Text('日付選択'),
            )
          ],
        ));
  }
}
