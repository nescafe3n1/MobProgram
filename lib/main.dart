import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() => runApp(const NaranjoFacebook());

class NaranjoFacebook extends StatelessWidget {
  const NaranjoFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      builder: (context, child) { 
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/login', // Set to Login for Activity 5
          routes: {
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/home': (context) => const HomeScreen(), 
          },
        );
      },
    );
  }
}