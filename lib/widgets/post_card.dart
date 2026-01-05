import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../screens/detail_screen.dart'; 
import 'custom_font.dart';

class PostCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final int numOfLikes;
  final String date;
  final bool hasImage;
  final String profileImage;
  final String? postImage;

  const PostCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.numOfLikes,
    required this.date,
    required this.hasImage,
    required this.profileImage,
    this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              userName: userName,
              postContent: postContent,
              date: date,
              numOfLikes: numOfLikes,
              imageUrl: hasImage ? postImage : null,
              profileImageUrl: profileImage,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(5), horizontal: 0),
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
                vertical: ScreenUtil().setHeight(5),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: ScreenUtil().setSp(20),
                    backgroundImage: AssetImage(profileImage),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(
                        text: userName,
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      SizedBox(height: ScreenUtil().setHeight(2)),
                      Row(
                        children: [
                          CustomFont(
                            text: date,
                            fontSize: ScreenUtil().setSp(10),
                            color: Colors.grey,
                          ),
                          SizedBox(width: ScreenUtil().setWidth(3)),
                          Icon(
                            Icons.public,
                            color: Colors.grey,
                            size: ScreenUtil().setSp(12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
                vertical: ScreenUtil().setHeight(5),
              ),
              child: CustomFont(
                text: postContent,
                fontSize: ScreenUtil().setSp(15),
                color: Colors.black,
              ),
            ),

            if (hasImage && postImage != null)
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
                child: Image.asset(
                  postImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            const Divider(height: 1, color: Colors.grey),
            Padding(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildReactionButton(
                    icon: Icons.thumb_up_alt_outlined,
                    text: 'Like',
                    color: numOfLikes > 0 ? FB_PRIMARY : Colors.grey,
                  ),
                  _buildReactionButton(
                    icon: Icons.comment_outlined,
                    text: 'Comment',
                    color: Colors.grey,
                  ),
                  _buildReactionButton(
                    icon: Icons.share_outlined,
                    text: 'Share',
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildReactionButton({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: ScreenUtil().setSp(16), color: color),
        SizedBox(width: ScreenUtil().setWidth(5)),
        CustomFont(
          text: text,
          fontSize: ScreenUtil().setSp(12),
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}