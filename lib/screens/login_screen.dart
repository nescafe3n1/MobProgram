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
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(height: 48.h, color: FB_DARK_PRIMARY),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        children: [
                          SizedBox(height: 30.h),
                          Image.asset('assets/images/NUCCITLogo_Black.png', height: 200.h),
                          SizedBox(height: 30.h),
                          CustomTextFormField(
                            controller: usernameController,
                            hintText: "Username",
                            fontSize: 15.sp, fontColor: FB_DARK_PRIMARY,
                            height: 18.h, width: 10.w,
                            validator: (val) => val!.isEmpty ? "Enter your username" : null,
                            onSaved: (val) => usernameController.text = val!,
                          ),
                          SizedBox(height: 18.h),
                          CustomTextFormField(
                            controller: passwordController,
                            hintText: "Password",
                            isObscure: _isObscured,
                            fontSize: 15.sp, fontColor: FB_DARK_PRIMARY,
                            height: 18.h, width: 10.w,
                            suffixIcon: IconButton(
                              icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility, color: FB_DARK_PRIMARY),
                              onPressed: () => setState(() => _isObscured = !_isObscured),
                            ),
                            validator: (val) => val!.isEmpty ? "Enter your password" : null,
                            onSaved: (val) => passwordController.text = val!,
                          ),
                          SizedBox(height: 50.h),
                          CustomInkwellButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacementNamed(context, '/home', arguments: usernameController.text);
                              }
                            },
                            height: 48.h, width: double.infinity,
                            buttonName: "Login", fontSize: 15.sp, fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40.h, color: FB_DARK_PRIMARY,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You do not have an account? ", style: TextStyle(color: Colors.white70)),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: Text(
                          "Register here", 
                          style: TextStyle(color: FB_LIGHT_PRIMARY, fontWeight: FontWeight.w900, fontSize: 15.sp),
                        ),
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