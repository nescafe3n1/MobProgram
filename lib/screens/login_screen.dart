import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/custom_inkwell_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: ScreenUtil().setHeight(40),
                      color: FB_DARK_PRIMARY,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        children: [
                          SizedBox(height: 50.h),
                          Image.asset('assets/images/tiger.jpeg', height: 150.h),
                          SizedBox(height: 30.h),
                          CustomTextFormField(
                            controller: _usernameController,
                            hintText: "Username",
                            fontSize: 15.sp,
                            fontColor: FB_DARK_PRIMARY,
                            height: 18.h,
                            width: 10.w,
                            validator: (val) => val!.isEmpty ? "Enter your username" : null,
                            onSaved: (val) => _usernameController.text = val!,
                          ),
                          SizedBox(height: 18.h),
                          CustomTextFormField(
                            controller: _passwordController,
                            hintText: "Password",
                            isObscure: _isObscured,
                            fontSize: 15.sp,
                            fontColor: FB_DARK_PRIMARY,
                            height: 18.h,
                            width: 10.w,
                            suffixIcon: IconButton(
                              icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility),
                              onPressed: () => setState(() => _isObscured = !_isObscured),
                            ),
                            validator: (val) => val!.isEmpty ? "Enter your password" : null,
                            onSaved: (val) => _passwordController.text = val!,
                          ),
                          SizedBox(height: 50.h),
                          CustomInkwellButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // Enhancement 3: Passing name to Home
                                Navigator.pushReplacementNamed(context, '/home', arguments: _usernameController.text);
                              }
                            },
                            height: 48.h,
                            width: double.infinity,
                            buttonName: "Login",
                            fontSize: 15.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40.h,
                  color: FB_DARK_PRIMARY,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You do not have an account? ", style: TextStyle(color: Colors.white70)),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: const Text("Register here", style: TextStyle(color: FB_LIGHT_PRIMARY, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}