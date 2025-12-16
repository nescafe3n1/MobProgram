import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naranjo_mobprog/constants.dart';
import 'package:naranjo_mobprog/screens/home_screen.dart';

void main() => runApp(const NaranjoFacebook());

class NaranjoFacebook extends StatelessWidget {
  const NaranjoFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) { 
        return MaterialApp(
          title: 'Facebook Naranjo', 
          debugShowCheckedModeBanner: false,
          initialRoute: '/home',
          routes: {
            '/home': (context) => const HomeScreen(), 
          },
          theme: ThemeData(
            primaryColor: FB_PRIMARY,
          ),
        );
      },
    );
  }
}