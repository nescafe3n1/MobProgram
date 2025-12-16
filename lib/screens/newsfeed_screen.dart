import 'package:flutter/material.dart';
import '../widgets/post_card.dart'; 
import '../widgets/custom_font.dart';
import '../constants.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        PostCard( 
          userName: 'Cyrus Robles', 
          postContent: 'Kamusta',
          numOfLikes: 100, 
          date: 'October 11',
          hasImage: false,
          profileImage: 'assets/images/cyrus.jpg', 
        ),
        
        PostCard(
          userName: 'Roben Juanatas', 
          postContent: 'Kicking off the holiday season with ICpEP-NCR!',
          numOfLikes: 200, 
          date: 'December 2',
          hasImage: true,
          profileImage: 'assets/images/icpep-blue.png',
          postImage: 'assets/images/icpep-blue.png', 
        ),
        
        PostCard(
          userName: 'Olive Musca', 
          postContent: 'One thought per sometime',
          numOfLikes: 450, 
          date: 'August 28',
          hasImage: true,
          profileImage: 'assets/images/bunny.jpg',
          postImage: 'assets/images/otpst.jpeg', 
        ),
        
        PostCard(
          userName: 'Mackenzie Iguiron', 
          postContent: 'Just finished my first Flutter project!',
          numOfLikes: 32, 
          date: 'Today',
          hasImage: false,
          profileImage: 'assets/images/mac.jpg',
        ),
        
        PostCard(
          userName: 'Ronald Sena', 
          postContent: 'My main agent is Atra, add me on Valorant AstraGods#nocap',
          numOfLikes: 99, 
          date: 'Yesterday',
          hasImage: true,
          profileImage: 'assets/images/astra.jpg',
          postImage: 'assets/images/ronald.png', 
        ),
      ],
    );
  }
}