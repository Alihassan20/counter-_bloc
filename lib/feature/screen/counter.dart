import 'package:quiver/async.dart';
import 'package:flutter/material.dart';

class HomeCount extends StatefulWidget {
  const HomeCount({Key? key}) : super(key: key);

  @override
  _HomeCountState createState() => _HomeCountState();
}

class _HomeCountState extends State<HomeCount> {
  final int _start = 10;
  int _current = 10;



  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: _start),
      const Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: RaisedButton(
        color: Colors.green.withOpacity(0.5),
        onPressed: () {
          startTimer();
        },
        child: _current != 0
            ? Text(
                "$_current",
                style:const TextStyle(
                  color: Colors.white,
                ),
              )
            : const Text(
                "Resent",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
      )),
    );
  }
}

// Timer? _timer;
// int _start = 10;
//
// void startTimer() {
//   const oneSec =  Duration(seconds: 1);
//   _timer =  Timer.periodic(
//     oneSec,
//         (Timer timer) {
//       if (_start == 0) {
//         setState(() {
//           timer.cancel();
//         });
//       } else {
//         setState(() {
//           _start--;
//         });
//       }
//     },
//   );
// }
// @override
// void dispose() {
//   _timer!.cancel();
//   super.dispose();
// }