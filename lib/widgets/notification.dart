import '../widgets/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notification extends StatelessWidget {
  final String name;
  final String post;
  final String description;

  const Notification(
      {super.key, 
      required this.name,
      required this.post,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setSp(15)),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25, 
            child: Icon(Icons.person),
          ),
          SizedBox(width: ScreenUtil().setWidth(10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFont(
                text: name,
                fontSize: ScreenUtil().setSp(20),
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
              CustomFont(
                text: 'Posted: $post',
                fontSize: ScreenUtil().setSp(13),
                color: Colors.black,
              ),
              SizedBox(
                width: ScreenUtil().screenWidth * 0.7,
                child: CustomFont(
                  text: description,
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}