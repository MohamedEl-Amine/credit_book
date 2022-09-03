import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screens/AlimenationScreen/alimentation_screen.dart';
import '../Screens/BoucherScreen/boucher_screen.dart';
import '../Screens/LegumeScreen/legume_screen.dart';
import '../database/data_file.dart';
import 'background.dart';

class BodyScreenWelcome extends StatefulWidget {
  const BodyScreenWelcome({Key? key}) : super(key: key);

  @override
  State<BodyScreenWelcome> createState() => _BodyScreenWelcomeState();
}

class _BodyScreenWelcomeState extends State<BodyScreenWelcome> {
  Sqflite sqflite = Sqflite();
  @override
  Widget build(BuildContext context) {
    return HomePageScreen(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => AlimentationScreen()),
                    (Route<dynamic> route) => false);
              },
              child: Container(
                width: 130.r,
                height: 120.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(44, 60, 83, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 80.r,
                        height: 80.r,
                        child: Image.asset('icons/pes.png')),
                    Text(
                      'Alimentation',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LegumeScreen()),
                    (Route<dynamic> route) => false);
              },
              child: Container(
                width: 130.r,
                height: 120.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(44, 60, 83, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.r,
                      height: 80.r,
                      child: Image.asset('icons/food.png'),
                    ),
                    Text(
                      'Légumes',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => BoucherScreen(),
                    ),
                    (Route<dynamic> route) => false);
              },
              child: Container(
                width: 130.r,
                height: 120.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(44, 60, 83, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 80.r,
                        height: 80.r,
                        child: Image.asset('icons/pool.png')),
                    Text(
                      'Boucher',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       sqflite.deletData(
                    //           "DELETE FROM 'totalamountlegume' WHERE id = ${1}");
                    //     },
                    // child: Text('child'))
                  ],
                ),
              ),
            ),
            Text("by Med Elamine")
          ],
        ),
      ),
    );
  }
}
