import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/custom_inkwell_button.dart';
import '../widgets/custom_dialogs.dart';
import '../widgets/custom_font.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  
  bool _isObscure = true;
  bool _isObscureConfirm = true;

  void _handleRegister() {
    String password = passwordController.text;
    RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    if (firstNameController.text.isEmpty || lastNameController.text.isEmpty || 
        usernameController.text.isEmpty || contactController.text.isEmpty) {
      customDialog(context, title: "Error", content: "All fields are required to continue.");
    } else if (contactController.text.length != 11) {
      customDialog(context, title: "Error", content: "The mobile number must be 11 digit");
    } else if (!passwordRegex.hasMatch(password)) {
      customDialog(context, title: "Error", content: "Password should be 8 characters, a mixture of letter and numbers consisting of at least one special character with Uppercase and Lowercase letters.");
    } else if (password != confirmPasswordController.text) {
      customDialog(context, title: "Error", content: "Passwords do not match.");
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
          child: Column(
            children: [
              CustomFont(text: "Register Here", fontSize: 25.sp, fontWeight: FontWeight.bold, color: FB_DARK_PRIMARY),
              SizedBox(height: 20.h),
              CustomTextFormField(controller: firstNameController, hintText: "First Name", fontSize: 15.sp, fontColor: Colors.black, height: 18.h, width: 10.w, validator: (v)=>null, onSaved: (v)=>null),
              SizedBox(height: 15.h),
              CustomTextFormField(controller: lastNameController, hintText: "Last Name", fontSize: 15.sp, fontColor: Colors.black, height: 18.h, width: 10.w, validator: (v)=>null, onSaved: (v)=>null),
              SizedBox(height: 15.h),
              CustomTextFormField(controller: usernameController, hintText: "Username", fontSize: 15.sp, fontColor: Colors.black, height: 18.h, width: 10.w, validator: (v)=>null, onSaved: (v)=>null),
              SizedBox(height: 15.h),
              TextFormField(
                controller: contactController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: "Contact Number",
                  fillColor: Colors.black12, filled: true,
                  contentPadding: EdgeInsets.fromLTRB(10.w, 18.h, 10.w, 18.h),
                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: FB_DARK_PRIMARY, width: 2), borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(
                controller: passwordController, hintText: "Password", isObscure: _isObscure, fontSize: 15.sp, fontColor: Colors.black, height: 18.h, width: 10.w,
                suffixIcon: IconButton(icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility), onPressed: () => setState(() => _isObscure = !_isObscure)),
                validator: (v)=>null, onSaved: (v)=>null,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(
                  "Password should be 8 characters, a mixture of letter and numbers consisting of at least one special character with Uppercase and Lowercase letters.",
                  style: TextStyle(color: Colors.black45, fontSize: ScreenUtil().setSp(10)),
                ),
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(
                controller: confirmPasswordController, hintText: "Confirm Password", isObscure: _isObscureConfirm, fontSize: 15.sp, fontColor: Colors.black, height: 18.h, width: 10.w,
                suffixIcon: IconButton(icon: Icon(_isObscureConfirm ? Icons.visibility_off : Icons.visibility), onPressed: () => setState(() => _isObscureConfirm = !_isObscureConfirm)),
                validator: (v)=>null, onSaved: (v)=>null,
              ),
              SizedBox(height: 30.h),
              CustomInkwellButton(onTap: _handleRegister, height: 45.h, width: double.infinity, buttonName: "Submit", fontSize: 15.sp, fontWeight: FontWeight.bold),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You have an account? ", style: TextStyle(color: Colors.black45)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text("Login here", style: TextStyle(color: FB_DARK_PRIMARY, fontWeight: FontWeight.w900, fontSize: 15.sp)), 
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}