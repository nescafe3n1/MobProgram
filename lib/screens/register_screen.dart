import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/custom_inkwell_button.dart';
import '../widgets/custom_dialogs.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  void _handleRegister() {
    // Enhancement 2: Custom Validations with Dialogs
    if (_userController.text.isEmpty || _passController.text.isEmpty) {
      customDialog(context, title: "Error", content: "All fields are required to continue.");
    } else if (_mobileController.text.length != 11) {
      customDialog(context, title: "Error", content: "The mobile number must be 11 digits.");
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Here"), backgroundColor: FB_DARK_PRIMARY),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            CustomTextFormField(
              controller: _userController,
              hintText: "Username",
              fontSize: 15.sp,
              fontColor: Colors.black,
              height: 10.h, width: 10.w,
              validator: (v) => null, onSaved: (v) => null,
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
              controller: _mobileController,
              hintText: "Mobile Number",
              fontSize: 15.sp,
              fontColor: Colors.black,
              height: 10.h, width: 10.w,
              validator: (v) => null, onSaved: (v) => null,
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
              controller: _passController,
              hintText: "Password",
              isObscure: true,
              fontSize: 15.sp,
              fontColor: Colors.black,
              height: 10.h, width: 10.w,
              validator: (v) => null, onSaved: (v) => null,
            ),
            const Spacer(),
            CustomInkwellButton(
              onTap: _handleRegister,
              height: 45.h,
              width: double.infinity,
              buttonName: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}