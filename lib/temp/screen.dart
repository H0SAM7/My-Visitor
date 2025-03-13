import 'package:flutter/material.dart';

class screenTSt extends StatelessWidget {
  const screenTSt({super.key});
  static String id = 'screenTSt';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Center(child: Text('Success'))],
      ),
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            """
يارب حسام ياخد اعفاء
         من الجيش
""",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }
}
