import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_visitor/features/hotels/data/repos/hotel_repo_impl.dart';

class screenTSt extends StatelessWidget {
  const screenTSt({super.key});
  static String id = 'screenTSt';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: IconButton(
                  onPressed: () async {
                 var tt=   await HotelRepoImpl().featchAllhotels();
                    log('${tt}');
                  },
                  icon: Icon(Icons.airplanemode_inactive_outlined)))
        ],
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
