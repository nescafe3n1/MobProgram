import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/detail_screen.dart';
import '../widgets/custom_font.dart';

class CustomInformation extends StatelessWidget {
  final String name;
  final String post;
  final String description;
  final String? profileImageUrl;
  final String date;
  final int numOfLikes;
  final String? imageUrl;
  final bool atProfile;

  const CustomInformation({
    super.key,
    required this.name,
    required this.post,
    required this.description,
    this.profileImageUrl,
    required this.date,
    this.numOfLikes = 0,
    this.imageUrl,
    this.atProfile = false,
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
              profileImageUrl: profileImageUrl ?? "",
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(ScreenUtil().setSp(15)),
        child: Row(
          children: [
            profileImageUrl == null || profileImageUrl!.isEmpty
                ? const Icon(Icons.person, size: 40)
                : CircleAvatar(
                    radius: ScreenUtil().setSp(25),
                    backgroundImage: AssetImage(profileImageUrl!),
                  ),
            SizedBox(width: ScreenUtil().setWidth(18)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    text: name,
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  CustomFont(
                    text: "Posted: $post",
                    fontSize: ScreenUtil().setSp(13),
                    color: Colors.black,
                  ),
                  CustomFont(
                    text: description,
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  CustomFont(
                    text: date,
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}