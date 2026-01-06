import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../screens/detail_screen.dart';
import 'custom_font.dart';

class PostCard extends StatefulWidget {
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
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int currentLikes;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    currentLikes = widget.numOfLikes;
  }

  void _toggleLike() {
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

  void _goToDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          userName: widget.userName,
          postContent: widget.postContent,
          date: widget.date,
          numOfLikes: currentLikes, 
          imageUrl: widget.hasImage ? widget.postImage : null,
          profileImageUrl: widget.profileImage,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color customActionColor = Color(0xFF00302E); 

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Navigable Content Area
          InkWell(
            onTap: _goToDetail,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.w,
                        backgroundImage: AssetImage(widget.profileImage),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFont(
                            text: widget.userName, 
                            fontSize: 16.sp, 
                            fontWeight: FontWeight.bold, 
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              CustomFont(text: widget.date, fontSize: 12.sp, color: Colors.grey),
                              SizedBox(width: 4.w),
                              Icon(Icons.public, size: 14.sp, color: Colors.grey), 
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
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  child: CustomFont(
                    text: widget.postContent, 
                    fontSize: 15.sp, 
                    color: Colors.black,
                  ),
                ),
                if (widget.hasImage && widget.postImage != null)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Image.asset(
                      widget.postImage!, 
                      width: double.infinity, 
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 0.5),

          // Action Bar: Restored all buttons side-by-side
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distributes buttons evenly
              children: [
                // Interactive Like Button
                TextButton.icon(
                  onPressed: _toggleLike,
                  icon: Icon(
                    isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                    size: 20.sp,
                    color: customActionColor,
                  ),
                  label: CustomFont(
                    text: currentLikes.toString(),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: customActionColor,
                  ),
                ),

                // Restored Comment Button
                _buildStaticButton(
                  Icons.chat_bubble_outline, 
                  "Comment", 
                  customActionColor,
                ),

                // Restored Share Button
                _buildStaticButton(
                  Icons.reply, 
                  "Share", 
                  customActionColor, 
                  isFlipped: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to keep the Row code clean
  Widget _buildStaticButton(IconData icon, String label, Color color, {bool isFlipped = false}) {
    return Row(
      children: [
        Transform(
          alignment: Alignment.center,
          transform: isFlipped ? Matrix4.rotationY(3.14159) : Matrix4.identity(),
          child: Icon(icon, size: 20.sp, color: color),
        ),
        SizedBox(width: 8.w),
        CustomFont(
          text: label, 
          fontSize: 13.sp, 
          fontWeight: FontWeight.w600, 
          color: color,
        ),
      ],
    );
  }
}