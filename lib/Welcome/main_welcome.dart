import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_room/Screens/about/about_screen.dart';
import 'package:game_room/Welcome/body.dart';
import 'package:game_room/database/data_file.dart';
import '../Screens/AlimenationScreen/alimentation_screen.dart';
import '../Screens/BoucherScreen/boucher_screen.dart';
import '../Screens/LegumeScreen/legume_screen.dart';

class MainWelcomeScreen extends StatelessWidget {
  const MainWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(44, 60, 83, 1),
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white70,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(44, 60, 83, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 80.w,
                        child: Image.asset(
                          'icons/logo.jpg',
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'K',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'A',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'Y',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'A',
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            ' GAMES',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                height: 0.8.h),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text("By Mohamed Elamine")
                ],
              ),
            ),
            ListTile(
              title: Text('Alimentation'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlimentationScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Légumes'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LegumeScreen()));
              },
            ),
            ListTile(
              title: Text('Boucher'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BoucherScreen()));
                // M'edpro
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutScreeen()));
              },
            ),
          ],
        ),
      ),
      body: BodyScreenWelcome(),
    );
  }
}
