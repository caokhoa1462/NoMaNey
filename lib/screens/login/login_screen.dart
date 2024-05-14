import 'package:expense_management_application/screens/components/my_button.dart';
import 'package:expense_management_application/screens/components/square_tile.dart';
import 'package:expense_management_application/screens/components/textfield.dart';
import 'package:expense_management_application/screens/login/user_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'reset_password_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text editing controllers
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future loginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _usernameController.text.trim(),
      password: _passwordController.text.trim(),
    );
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 130,
                  height: 130,
                  child: Image(
                    image: AssetImage('assets/icons/Logo_icon.png'),
                  ),
                ),
              ),

              //welcome back
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Chào mừng đến với NoMaNey',
                  style: TextStyle(
                    fontFamily: 'Baloo',
                    color: Colors.black,
                    fontSize: 24.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Nhập tên người dùng/email/số điện thoại',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Nhập mật khẩu',
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10),
              //   child: MyTextField(
              //     controller: _usernameController,
              //     hintText: 'Nhập tên người dùng/email/số điện thoại',
              //     errorStyle: TextStyle(color: Colors.red),
              //     errorText: _isNotValidated && _usernameController.text.isEmpty
              //         ? "Vui lòng nhập thông tin vào"
              //         : null,
              //   ),
              // ),

              // //password textfield
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 8),
              //   child: MyTextField(
              //     controller: _passwordController,
              //     hintText: 'Mật khẩu',
              //     errorStyle: TextStyle(color: Colors.red),
              //     errorText: _isNotValidated && _passwordController.text.isEmpty
              //         ? "Vui lòng nhập thông tin vào"
              //         : null,
              //     obscureText: true,
              //   ),
              // ),

              //forgot password button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(left: 220),
                    child: Text(
                      'Bạn quên mật khẩu?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        fontFamily: 'Baloo',
                      ),
                    ),
                  ),
                ),
              ),

              //sign-in button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: MyButton(
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Baloo',
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    loginUser();
                  },
                ),
              ),

              //or continue with
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
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: 'Baloo',
                          fontSize: 15,
                        )),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Chưa có tài khoản?',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Baloo',
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserRegistrationScreen()),
                        );
                      },
                      child: Text(
                        ' Đăng ký ngay',
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Baloo',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
