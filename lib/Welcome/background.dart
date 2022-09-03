import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // width: size.width,
      // height: size.height,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            // width: size.width,
            height: 70.h,
            color: const Color.fromRGBO(44, 60, 83, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 80.w,
                  child: Image.asset(
                    'icons/book.png',
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'B',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'O',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'O',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'K',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      ' Credit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.8),
                    ),
                  ],
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
