import 'package:flutter/material.dart';
import 'package:question/utility/localDB.dart';
import 'package:sizer/sizer.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/Border.png',
            width: 100.h,
            height: 100.w,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 10.w,
            left: 14.w,
            child: Text(
              LocalDB.getPoint != null
                  ? LocalDB.getPoint.toString() + ".0"
                  : "00.0",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 50.w,
            right: 40.h,
            child: SizedBox(
              width: 25.w,
              height: 5.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/dashboard', (route) => false);
                },
                child: Text(
                  "Start Game",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 8.sp, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
