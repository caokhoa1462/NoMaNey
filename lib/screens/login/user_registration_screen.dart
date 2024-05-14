import 'package:flutter/material.dart';
import 'package:expense_management_application/screens/components/textfield.dart';
import 'package:expense_management_application/screens/components/square_tile.dart';
import 'package:expense_management_application/screens/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRegistrationScreen extends StatefulWidget {
  UserRegistrationScreen({super.key});

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signUp() async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );
  }

  bool _isNotValidated = false;

  void registerUser() async {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      var regBody = {
        "email": _usernameController.text,
        "password": _passwordController.text,
      };
    } else {
      setState(() {
        _isNotValidated = true;
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
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
                  'Đăng ký tài khoản',
                  style: TextStyle(
                    fontFamily: 'Baloo',
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: MyTextField(
                  controller: _usernameController,
                  hintText: 'Nhập tên người dùng/email/số điện thoại',
                  errorStyle: TextStyle(color: Colors.red),
                  errorText: _isNotValidated && _usernameController.text.isEmpty
                      ? "Vui lòng nhập thông tin vào"
                      : null,
                ),
              ),

              //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: MyTextField(
                  controller: _passwordController,
                  hintText: 'Mật khẩu',
                  errorStyle: TextStyle(color: Colors.red),
                  errorText: _isNotValidated && _passwordController.text.isEmpty
                      ? "Vui lòng nhập thông tin vào"
                      : null,
                  obscureText: true,
                ),
              ),
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
                    registerUser();
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
