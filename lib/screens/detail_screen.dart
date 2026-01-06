import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_font.dart';

class DetailScreen extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final String? imageUrl;
  final String profileImageUrl;

  const DetailScreen({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    required this.numOfLikes,
    this.imageUrl,
    required this.profileImageUrl,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late int currentLikes;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    currentLikes = widget.numOfLikes;
  }

  void _handleLike() {
    setState(() {
      if (isLiked) {
        currentLikes--;
        isLiked = false;
      } else {
        currentLikes++;
        isLiked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color customActionColor = Color(0xFF00302E);

    return Scaffold(
      appBar: AppBar(
        title: CustomFont(text: widget.userName, fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.imageUrl != null) Image.asset(widget.imageUrl!, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(15.sp),
              child: Row(
                children: [
                  CircleAvatar(radius: 25.w, backgroundImage: AssetImage(widget.profileImageUrl)),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(text: widget.userName, fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
                      CustomFont(text: widget.date, fontSize: 12.sp, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: CustomFont(text: widget.postContent, fontSize: 15.sp, color: Colors.black),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: _handleLike,
                  icon: Icon(isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined, color: customActionColor),
                  label: CustomFont(text: currentLikes.toString(), fontSize: 14.sp, color: customActionColor),
                ),
                const Icon(Icons.chat_bubble_outline),
                const Icon(Icons.reply),
              ],
            ),
          ],
        ),
      ),
    );
  }
}