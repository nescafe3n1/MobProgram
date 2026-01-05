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
    this.numOfLikes = 0,
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomFont(
          text: widget.userName,
          fontSize: ScreenUtil().setSp(20),
          color: Colors.black,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty)
                Column(
                  children: [
                    Image.asset(widget.imageUrl!, fit: BoxFit.cover),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                  ],
                ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: ScreenUtil().setSp(25),
                      backgroundImage: AssetImage(widget.profileImageUrl),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: widget.userName,
                          fontSize: ScreenUtil().setSp(18),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            CustomFont(
                              text: widget.date,
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.grey,
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Icon(Icons.public, color: Colors.grey, size: ScreenUtil().setSp(18)),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),

              SizedBox(height: ScreenUtil().setHeight(15)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                alignment: Alignment.centerLeft,
                child: CustomFont(
                  text: widget.postContent,
                  fontSize: ScreenUtil().setSp(18),
                  color: Colors.black,
                ),
              ),

              SizedBox(height: ScreenUtil().setHeight(10)),
              const Divider(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: _handleLike,
                      icon: Icon(
                        isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined, 
                        color: FB_DARK_PRIMARY
                      ),
                      label: CustomFont(
                        text: currentLikes == 0 ? "Like" : currentLikes.toString(),
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_DARK_PRIMARY,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment, color: FB_DARK_PRIMARY),
                      label: CustomFont(
                        text: "Comment",
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_DARK_PRIMARY,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.redo, color: FB_DARK_PRIMARY),
                      label: CustomFont(
                        text: "Share",
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_DARK_PRIMARY,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}