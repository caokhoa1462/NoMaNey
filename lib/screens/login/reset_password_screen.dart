import 'package:flutter/material.dart';
import 'package:expense_management_application/screens/components/textfield.dart';
import 'package:expense_management_application/screens/components/my_button.dart';
import 'package:expense_management_application/screens/components/square_tile.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final resetpasswordController = TextEditingController();
  bool _isNotValidated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: 130,
                  height: 130,
                  child: Image(
                    image: AssetImage('assets/icons/Logo_icon.png'),
                  ),
                ),
              ),

              //Tiêu đề
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Quên mật khẩu?',
                  style: TextStyle(
                    fontFamily: 'Baloo',
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //Phần nhập email/SĐT
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: MyTextField(
                  controller: resetpasswordController,
                  hintText: 'Nhập email hoặc số điện thoại của bạn',
                                    errorStyle: TextStyle(color: Colors.red),
                  errorText: _isNotValidated ? "Vui lòng nhập thông tin vào" : null,
                ),
              ),

              //Nút xác nhận
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: MyButton(
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    // print('Reset password: ${resetpasswordController.text}');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Text('Hoặc là tiếp tục với',
                        style: TextStyle(color: Colors.grey[700])),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              //google, facebook
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //facebook button
                  SquareTile(
                    imagePath: 'assets/icons/logo_facebook.png',
                  ),

                  //google button
                  Container(
                      width: 57,
                      height: 57,
                      child: SquareTile(
                    imagePath: 'assets/icons/logo_google.png')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
