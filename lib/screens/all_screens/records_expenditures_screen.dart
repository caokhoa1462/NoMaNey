import 'package:expense_management_application/screens/all_screens/new_expenditure_screens.dart';
import 'package:flutter/material.dart';

class ScreenRecordsExpenditures extends StatelessWidget {
  const ScreenRecordsExpenditures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Records Expenditures'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bạn chưa có ghi lại chi tiêu nào',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Baloo',
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewExpenditure(),
                    ),
                  );
                },
                child: Text(
                  'Thêm chi tiêu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontFamily: 'Baloo',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
