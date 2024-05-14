import 'package:expense_management_application/screens/all_screens/records_expenditures_screen.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:expense_management_application/screens/components/calendar_date_picker.dart';

class NewExpenditure extends StatefulWidget {
  const NewExpenditure({super.key});

  @override
  State<NewExpenditure> createState() => _NewExpenditureState();
}

class _NewExpenditureState extends State<NewExpenditure> {
  var hour = 6;
  var minute = 0;
  var ampm = 0;
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tiêu đề

      appBar: AppBar(
        title: Text('Ghi chi tiêu'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Box để nhập loại chi tiêu

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nhập loại chi tiêu',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                    fontFamily: 'Baloo',
                    fontWeight: FontWeight.bold,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // Box để nhập số tiền

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Nhập số tiền',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                    fontFamily: 'Baloo',
                    fontWeight: FontWeight.bold,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // Box để nhập ngày tháng

            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                height: 53,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Màu nền của Container
                  borderRadius: BorderRadius.circular(10.0), // Bo góc
                  border: Border.all(
                    // Đường viền
                    color: Colors.white,
                  ),
                ),
                child: GestureDetector(
                  onTap: () async {
                    final DateTime? result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalendarPicker(),
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        _date = result;
                      });
                    }
                  },
                  child: Text(
                    _date != null
                        ? _date!.toLocal().toString().split(' ')[0]
                        : 'Chọn ngày', // Nội dung của nút
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                      fontFamily: 'Baloo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Wheel để chọn giờ

                    NumberPicker(
                      minValue: 1,
                      maxValue: 12,
                      value: hour,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 80,
                      itemHeight: 60,
                      onChanged: (value) {
                        setState(() {
                          hour = value;
                        });
                      },
                      textStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                      selectedTextStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Baloo',
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.transparent,
                          ),
                          bottom: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),

                    //Dấu 2 chấm giữa wheel giờ và wheel phút

                    Text(
                      ":",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Baloo',
                          color: Colors.black),
                    ),

                    // Wheel để chọn phút

                    NumberPicker(
                      minValue: 0,
                      maxValue: 59,
                      value: minute,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 80,
                      itemHeight: 60,
                      onChanged: (value) {
                        setState(() {
                          minute = value;
                        });
                      },
                      textStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                      selectedTextStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Baloo',
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.transparent,
                          ),
                          bottom: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),

                    // Wheel để chọn AM/PM

                    NumberPicker(
                      minValue: 0,
                      maxValue: 1,
                      value: ampm,
                      zeroPad: true,
                      infiniteLoop: false,
                      itemWidth: 80,
                      itemHeight: 60,
                      onChanged: (value) {
                        setState(() {
                          ampm = value;
                        });
                      },
                      textMapper: (number) {
                        if (number == '0') {
                          return "AM";
                        } else if (number == '1') {
                          return "PM";
                        }
                        return "";
                      },
                      textStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                      selectedTextStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Baloo',
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.transparent,
                          ),
                          bottom: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Box để nhập ghi chú

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nhập ghi chú',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                    fontFamily: 'Baloo',
                    fontWeight: FontWeight.bold,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                maxLines: null,
                minLines: 6,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenRecordsExpenditures(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        'Thêm chi tiêu',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Baloo',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
