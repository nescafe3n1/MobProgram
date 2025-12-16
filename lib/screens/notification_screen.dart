import 'package:flutter/material.dart';
import '../widgets/notification.dart' as notif;
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
              notif.Notification(name: 'Ivan Regodon', post: 'Post', description: 'Description',),
              Divider(),
              notif.Notification(name: 'Vergel Santiago', post: 'Photo', description: 'Liked your photo "Sunset"',),
              Divider(),
              notif.Notification(name: 'JB Natividad', post: 'Post', description: 'Commented on your post: "Nice view!"',),
              Divider(),
              notif.Notification(name: 'Hajj Macaraig', post: 'Reel', description: 'Shared your recent Reel.',),
              Divider(),
              notif.Notification(name: 'Christ Naval', post: 'Event', description: 'Invited you to "Flutter Workshop"',),
              Divider(),
              notif.Notification(name: 'Jose Neil Silagan', post: 'Page', description: 'Mentioned you in a post from "CompSci News"',),
              Divider(),
              notif.Notification(name: 'Venz Guardiano', post: 'Story', description: 'Replied to your story: "Awesome!"',),
              Divider(),
              notif.Notification(name: 'Marius Panahon', post: 'Post', description: 'Reacted with love to your latest update.',),
              Divider(),
              notif.Notification(name: 'Ovuvueke Ossas', post: 'Group', description: 'Has posted in "Mobile Programming Group"',),
              Divider(),
              notif.Notification(name: 'Poncho Pilato', post: 'Post', description: 'User I tagged you in a comment.',),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}