// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_room/Welcome/main_welcome.dart';
import 'package:game_room/database/data_file.dart';

import 'AddAndEdit/add_product.dart';
import 'AddAndEdit/edit_product.dart';

class AlimentationScreen extends StatefulWidget {
  const AlimentationScreen({Key? key}) : super(key: key);

  @override
  State<AlimentationScreen> createState() => _AlimentationScreenState();
}

class _AlimentationScreenState extends State<AlimentationScreen> {
  Sqflite sqflite = Sqflite();
  bool isLoading = false;
  List<Map<dynamic, dynamic>> persons = [];
  List credit = [];
  List<Map> totalAmount = [];
  num totalCredit = 0;
  static final _formKey = new GlobalKey<FormState>();
  late TextEditingController totalAmountController =
      TextEditingController(text: totalAmount[0]['totalamount']);

  refresh() {
    totalAmount = [];
    persons = [];
    credit = [];
    readData();
  }

  CalculatCredit() {
    num totalCredit = 0;
    for (var i in credit) {
      setState(() {
        totalCredit += int.parse(i["amount"]);
      });
    }
    return totalCredit;
  }

  CalculatRestAmount() {
    num totalAmountCalculate =
        int.parse(totalAmount[0]['totalamount']) - CalculatCredit();
    return totalAmountCalculate;
  }

  Future readData() async {
    List<Map> response = await sqflite.readData("SELECT * FROM alimentation");
    List creditBase = await sqflite.readData("SELECT amount from alimentation");
    List<Map> totalAmo =
        await sqflite.readData("SELECT * from totalamountalimentation");
    persons.addAll(response);
    credit.addAll(creditBase);
    totalAmount.addAll(totalAmo);
    if (totalAmount.length == 0) {
      sqflite.insertData(
          "INSERT INTO 'totalamountalimentation' ('totalamount') VALUES ('0')");
      List<Map> totalAmo =
          await sqflite.readData("SELECT * from totalamountalimentation");
      totalAmount.addAll(totalAmo);
    }
    isLoading = true;
    print(totalAmount);
    if (this.mounted) {
      setState(
        () {},
      );
    }
  }

  @override
  void initState() {
    readData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(36, 36, 36, 1),
        resizeToAvoidBottomInset: false,
        body: isLoading
            ? Container(
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: 20.r, top: 50.r, right: 20.r),
                      height: 110.h,
                      child: Column(
                        children: [
                          Container(
                            height: 30.h,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainWelcomeScreen()),
                                        (Route<dynamic> route) => false);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 25.r,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Alimentation",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddPersonScreen()),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 36.r,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20.h),
                                    child: Text(
                                      "Total Amount : ${totalAmount[0]['totalamount']} DA",
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(left: 15.w),
                                    child: Text(
                                      "Total of Credit : ${CalculatCredit()} DA",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    // margin: EdgeInsets.only(left: 15.w),
                                    child: Text(
                                      "Amount Rest : ${CalculatRestAmount()} DA",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Stack(
                                              children: <Widget>[
                                                Positioned(
                                                  right: -40.0,
                                                  top: -40.0,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: CircleAvatar(
                                                      child: Icon(Icons.close),
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                  ),
                                                ),
                                                Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                              " Update Total Amount")),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        child: TextFormField(
                                                          controller:
                                                              totalAmountController,
                                                          decoration:
                                                              const InputDecoration(
                                                                  hintText:
                                                                      "Amount"),
                                                          validator: (value) {
                                                            try {
                                                              int.parse(value!);
                                                              return null;
                                                            } catch (e) {
                                                              return 'Please enter Correct number';
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Color.fromRGBO(
                                                                    36,
                                                                    36,
                                                                    36,
                                                                    1),
                                                          ),
                                                          onPressed: () {
                                                            if (_formKey
                                                                .currentState!
                                                                .validate()) {
                                                              sqflite.updateData(
                                                                  "UPDATE 'totalamountalimentation' SET ('totalamount') = ('${totalAmountController.text}') WHERE id = ${1}");
                                                              refresh();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                      'Done'),
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          child: Text(
                                                              "Update Amount"),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  icon: Icon(
                                    Icons.system_update,
                                    size: 20.r,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.only(top: 10.r, left: 20.r, right: 20.r),
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: persons.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return Container(
                                    height: 80.r,
                                    margin: EdgeInsets.only(bottom: 20.r),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "icons/backgroundCredit.png"),
                                          fit: BoxFit.fill),
                                      color: Color.fromRGBO(47, 143, 157, 1),
                                      border: Border.all(width: 1.r),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 15.r),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 40),
                                              child: Text(
                                                '${persons[i]['amount']} DA',
                                                style: TextStyle(
                                                    fontSize: 25.sp,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Container(
                                              height: 20.r,
                                              width: 20.r,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditPersonScreen(
                                                        // refreshFun: refresh(),
                                                        oldAmount: persons[i]
                                                            ['amount'],
                                                        oldDate: persons[i]
                                                            ['date'],
                                                        id: persons[i]['id'],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  child: Image.asset(
                                                    "icons/edit.png",
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.r,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.r,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 10.r,
                                            ),
                                            Text(
                                              'Date of Creation : ${persons[i]['date']}',
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Container(child: CircularProgressIndicator()),
              ));
  }
}
