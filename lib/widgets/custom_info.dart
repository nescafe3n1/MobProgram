import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/detail_screen.dart';
import 'custom_font.dart';

class CustomInformation extends StatelessWidget {
  final String name;
  final String post;
  final String description;
  final String profileImageUrl; // Required for the icon
  final String date;
  final int numOfLikes;
  final String? imageUrl;

  const CustomInformation({
    super.key,
    required this.name,
    required this.post,
    required this.description,
    required this.profileImageUrl,
    required this.date,
    this.numOfLikes = 0,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              userName: name,
              postContent: description,
              date: date,
              numOfLikes: numOfLikes,
              imageUrl: imageUrl,
              profileImageUrl: profileImageUrl, // Passes the icon to detail screen
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.w,
              backgroundImage: AssetImage(profileImageUrl), // Displays the icon
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(text: name, fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
                  CustomFont(text: "$post: $description", fontSize: 14.sp, color: Colors.black87),
                  CustomFont(text: date, fontSize: 12.sp, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}