import 'package:expense_management_application/screens/all_screens/new_expenditure_screens.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Xem chi tiêu

              Container(
                margin: EdgeInsets.only(top: 30),
                width: 355,
                height: 240,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(113, 99, 156, 1),
                      Color.fromRGBO(7, 58, 103, 1),
                    ],
                    transform: const GradientRotation(4),
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SỐ DƯ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Baloo',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      '10000 VND',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Baloo',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          'Số tiền bạn đã chi trong',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Baloo',
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_right_alt_rounded,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "24h qua",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Baloo',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    "630000 VND",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Baloo',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_right_alt_rounded,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "1 tuần qua",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Baloo',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    "4000000 VND",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Baloo',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      
      //Nút cho phép vào màn hình ghi chi tiêu
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewExpenditure(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey.shade600,
      ),
    );
  }
}
