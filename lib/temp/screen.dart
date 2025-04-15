import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/features/hotelsff/data/repos/hotel_repo_impl.dart';
import 'package:my_visitor/features/hotelsff/presentation/manager/hotel_cubit/hotel_cubit.dart';

class screenTSt extends StatefulWidget {
  const screenTSt({super.key});
  static String id = 'screenTSt';

  @override
  State<screenTSt> createState() => _screenTStState();
}

class _screenTStState extends State<screenTSt> {
  @override
  void initState() {
    tst();
    super.initState();
  }

  void tst() async {
    await BlocProvider.of<HotelCubit>(context).fetchHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: IconButton(
                  onPressed: () async {
                    var tt = await BlocProvider.of<HotelCubit>(context)
                        .fetchHotels();
                    log('%%%%%%%%%%');
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
