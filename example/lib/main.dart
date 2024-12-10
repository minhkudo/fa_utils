import 'package:fa_utils/view/gallery/gallery_view.dart';
import 'package:fa_utils/view/gallery/media_selection_controller.dart';
import 'package:fa_utils/view/time/count_timer.dart';
import 'package:fa_utils/view/time/count_timer_controller.dart';
import 'package:fa_utils/view/time/test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Count Time',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;

  late CountTimerController _controller = CountTimerController(
      vsync: this,
      begin: Duration(seconds: 12),
      end: Duration(seconds: 1),
      initialState: CountTimerState.reset,
      interval: CountTimerInterval.milliseconds);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: CountTimer(
          controller: _controller,
          builder: (state, remaining) {
            print('alo');
            return Column(
              children: [
                Text("${state.name}", style: TextStyle(fontSize: 24.0)),
                Text("${remaining.hours}:${remaining.minutes}:${remaining.seconds}.${remaining.milliseconds}",
                    style: TextStyle(fontSize: 24.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedButton(
                      text: "Start",
                      color: Colors.green,
                      onPressed: () => _controller.start(),
                    ),
                    RoundedButton(
                      text: "Pause",
                      color: Colors.blue,
                      onPressed: () => _controller.pause(),
                    ),
                    RoundedButton(
                      text: "Reset",
                      color: Colors.red,
                      onPressed: () => _controller.reset(),
                    )
                  ],
                ),
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedButton(
                      text: "Set Begin to 5s",
                      color: Colors.purple,
                      onPressed: () => _controller.begin = Duration(seconds: 5),
                    ),
                    RoundedButton(
                      text: "Set End to 5s",
                      color: Colors.purple,
                      onPressed: () => _controller.end = Duration(seconds: 5),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedButton(
                      text: "Jump to 5s",
                      color: Colors.indigo,
                      onPressed: () => _controller.jumpTo(Duration(seconds: 5)),
                    ),
                    RoundedButton(
                      text: "Finish",
                      color: Colors.orange,
                      onPressed: () => _controller.finish(),
                    )
                  ],
                ),
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedButton(
                      text: "Add 5s",
                      color: Colors.teal,
                      onPressed: () => _controller.add(Duration(seconds: 5)),
                    ),
                    RoundedButton(
                      text: "Subtract 5s",
                      color: Colors.teal,
                      onPressed: () => _controller.subtract(Duration(seconds: 5)),
                    )
                  ],
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.pause(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;

  RoundedButton({required this.text, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text, style: TextStyle(color: Colors.white)),
      style: TextButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
      onPressed: onPressed,
    );
  }
}
