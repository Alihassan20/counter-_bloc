import 'package:quiver/async.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TweenAnimationBuilder(
            duration: const Duration(seconds: 10),
            tween:
                Tween(begin: const Duration(seconds: 10), end: Duration.zero),
            onEnd: () {
              print('Timer ended');
            },
            builder: (BuildContext context, Duration value, Widget? child) {
              var seconds = value.inSeconds;
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: RaisedButton(
                    onPressed: () {

                      print("dfd");

                    },
                    child: seconds != 0
                        ? Text('$seconds',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20))
                        : const Text("Resend",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                  ));
            }),
      ),
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
