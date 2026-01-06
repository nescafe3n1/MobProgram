import 'package:flutter/material.dart';
import '../widgets/custom_info.dart' as notif; 

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: const [
        notif.CustomInformation(
          name: 'Ivan Regodon', 
          post: 'Post', 
          description: 'posted a new update.',
          date: 'January 5, 2026',
          numOfLikes: 10,
          profileImageUrl: 'assets/images/ivan.jpg',
        ),
        Divider(height: 1),
        notif.CustomInformation(
          name: 'Vergel Santiago', 
          post: 'Photo', 
          description: 'liked your photo "Sunset".',
          date: 'January 4, 2026',
          numOfLikes: 5,
          profileImageUrl: 'assets/images/vergel.jpg',
        ),
        Divider(height: 1),
        notif.CustomInformation(
          name: 'JB Natividad', 
          post: 'Post', 
          description: 'commented: "Nice view!"',
          date: 'January 4, 2026',
          numOfLikes: 2,
          profileImageUrl: 'assets/images/jb.jpg',
        ),
        Divider(height: 1),
        notif.CustomInformation(
          name: 'Hajj Macaraig', 
          post: 'Reel', 
          description: 'shared your recent Reel.',
          date: 'January 3, 2026',
          numOfLikes: 15,
          profileImageUrl: 'assets/images/hajj.jpg',
        ),
        Divider(height: 1),
        notif.CustomInformation(
          name: 'Christ Naval', 
          post: 'Event', 
          description: 'invited you to "Flutter Workshop".',
          date: 'January 3, 2026',
          numOfLikes: 0,
          profileImageUrl: 'assets/images/christ.jpg',
        ),
        Divider(height: 1),
        notif.CustomInformation(
          name: 'Jose Neil Silagan', 
          post: 'Page', 
          description: 'mentioned you in a post.',
          date: 'January 2, 2026',
          numOfLikes: 8,
          profileImageUrl: 'assets/images/jose.jpg',
        ),
        Divider(height: 1),
        notif.CustomInformation(
          name: 'Venz Guardiano', 
          post: 'Story', 
          description: 'replied to your story: "Awesome!"',
          date: 'January 2, 2026',
          numOfLikes: 1,
          profileImageUrl: 'assets/images/venz.jpg',
        ),
        Divider(height: 1),
        notif.CustomInformation(
          name: 'Marius Panahon', 
          post: 'Post', 
          description: 'reacted with love to your update.',
          date: 'January 1, 2026',
          numOfLikes: 20,
          profileImageUrl: 'assets/images/marius.jpg',
        ),
        Divider(height: 1),
        notif.CustomInformation(
          name: 'Ovuvueke Ossas', 
          post: 'Group', 
          description: 'posted in "Mobile Programming".',
          date: 'January 1, 2026',
          numOfLikes: 12,
          profileImageUrl: 'assets/images/ossas.jpg',
        ),
        Divider(height: 1),
        notif.CustomInformation(
          name: 'Poncho Pilato', 
          post: 'Post', 
          description: 'tagged you in a comment.',
          date: 'December 31, 2025',
          numOfLikes: 3,
          profileImageUrl: 'assets/images/poncho.jpg',
        ),
      ],
    );
  }
}