import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants.dart';
import '../screens/detail_screen.dart';
import 'custom_font.dart';

class PostCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final int numOfLikes;
  final String date;
  final String profileImage;
  final String? postImage;
  final bool hasImage;
  final bool isAds; 
  final String? adsMarket;

  const PostCard({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    required this.date,
    required this.profileImage,
    this.postImage,
    this.hasImage = false,
    this.isAds = false,
    this.adsMarket,
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

  Widget _buildImage(String path, {bool isAvatar = false}) {
    if (path.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: path,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageBuilder: isAvatar 
          ? (context, provider) => CircleAvatar(backgroundImage: provider, radius: 20.w)
          : null,
        fit: BoxFit.cover,
        width: isAvatar ? null : double.infinity,
      );
    }
    return isAvatar 
      ? CircleAvatar(backgroundImage: AssetImage(path), radius: 20.w)
      : Image.asset(path, fit: BoxFit.cover, width: double.infinity);
  }

  @override
  Widget build(BuildContext context) {
    const Color customActionColor = Color(0xFF00302E);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: _goToDetail,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: _buildImage(widget.profileImage, isAvatar: true),
              title: CustomFont(text: widget.userName, fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
              subtitle: CustomFont(text: widget.date, fontSize: 12.sp, color: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              child: CustomFont(text: widget.postContent, fontSize: 15.sp, color: Colors.black),
            ),
            if (widget.hasImage && widget.postImage != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: _buildImage(widget.postImage!),
              ),
            
            if (widget.isAds)
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.grey[100], 
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomFont(text: "MORE DETAILS", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                        CustomFont(text: widget.adsMarket ?? "Ikaw na ito!", fontSize: 14, color: Colors.black54),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),

            if (!widget.isAds) ...[
              const Divider(height: 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () => setState(() { isLiked = !isLiked; isLiked ? currentLikes++ : currentLikes--; }),
                      icon: Icon(isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined, color: customActionColor),
                      label: CustomFont(text: currentLikes.toString(), fontSize: 13.sp, color: customActionColor),
                    ),
                    const Row(children: [Icon(Icons.chat_bubble_outline, size: 20, color: customActionColor), SizedBox(width: 5), Text("Comment")]),
                    const Row(children: [Icon(Icons.reply, size: 20, color: customActionColor), SizedBox(width: 5), Text("Share")]),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}