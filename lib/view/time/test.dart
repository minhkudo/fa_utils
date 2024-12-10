import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late StreamController<int> _streamController;
  late Stream<int> _timerStream;
  late int _startTime;
  late int _currentTime;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _startTime = 10; // Thời gian bắt đầu là 10 giây
    _currentTime = _startTime;
    _streamController = StreamController<int>();
    _timerStream = _streamController.stream;
  }

  // Bắt đầu đếm thời gian
  void startTimer() {
    if (_isRunning) return;

    _isRunning = true;
    _currentTime = _startTime;

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentTime <= 0) {
        timer.cancel();
        _isRunning = false;
      } else {
        _currentTime--;
        _streamController.add(_currentTime); // Phát giá trị mới vào Stream
      }
    });
  }

  // Dừng hẹn giờ
  void stopTimer() {
    _isRunning = false;
    _streamController.add(_currentTime); // Phát giá trị hiện tại vào Stream
  }

  // Đặt lại hẹn giờ
  void resetTimer() {
    _isRunning = false;
    _currentTime = _startTime;
    _streamController.add(_currentTime); // Phát lại giá trị ban đầu vào Stream
  }

  @override
  void dispose() {
    _streamController.close(); // Đảm bảo đóng StreamController khi widget bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: _timerStream,
              initialData: _startTime,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data}',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  );
                } else {
                  return Text('No Data');
                }
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _isRunning ? null : startTimer,
                  child: Text('Start'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _isRunning ? stopTimer : null,
                  child: Text('Stop'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: resetTimer,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
