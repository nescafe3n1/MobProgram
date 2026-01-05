import 'package:flutter/material.dart';
import '../widgets/custom_info.dart' as notif; 
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_font.dart';
import '../constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1), 
        
        Expanded(
          child: ListView(
            children: const [
              notif.CustomInformation(
                name: 'Ivan Regodon', 
                post: 'Post', 
                description: 'Description',
                date: 'January 5, 2026',
                numOfLikes: 10,
              ),
              Divider(),
              notif.CustomInformation(
                name: 'Vergel Santiago', 
                post: 'Photo', 
                description: 'Liked your photo "Sunset"',
                date: 'January 4, 2026',
                numOfLikes: 5,
              ),
              Divider(),
              notif.CustomInformation(
                name: 'JB Natividad', 
                post: 'Post', 
                description: 'Commented on your post: "Nice view!"',
                date: 'January 4, 2026',
                numOfLikes: 2,
              ),
              Divider(),
              notif.CustomInformation(
                name: 'Hajj Macaraig', 
                post: 'Reel', 
                description: 'Shared your recent Reel.',
                date: 'January 3, 2026',
                numOfLikes: 15,
              ),
              Divider(),
              notif.CustomInformation(
                name: 'Christ Naval', 
                post: 'Event', 
                description: 'Invited you to "Flutter Workshop"',
                date: 'January 3, 2026',
                numOfLikes: 0,
              ),
              Divider(),
              notif.CustomInformation(
                name: 'Jose Neil Silagan', 
                post: 'Page', 
                description: 'Mentioned you in a post from "CompSci News"',
                date: 'January 2, 2026',
                numOfLikes: 8,
              ),
              Divider(),
              notif.CustomInformation(
                name: 'Venz Guardiano', 
                post: 'Story', 
                description: 'Replied to your story: "Awesome!"',
                date: 'January 2, 2026',
                numOfLikes: 1,
              ),
              Divider(),
              notif.CustomInformation(
                name: 'Marius Panahon', 
                post: 'Post', 
                description: 'Reacted with love to your latest update.',
                date: 'January 1, 2026',
                numOfLikes: 20,
              ),
              Divider(),
              notif.CustomInformation(
                name: 'Ovuvueke Ossas', 
                post: 'Group', 
                description: 'Has posted in "Mobile Programming Group"',
                date: 'January 1, 2026',
                numOfLikes: 12,
              ),
              Divider(),
              notif.CustomInformation(
                name: 'Poncho Pilato', 
                post: 'Post', 
                description: 'User I tagged you in a comment.',
                date: 'December 31, 2025',
                numOfLikes: 3,
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}