import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/post_card.dart';
import '../widgets/custom_font.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  List<Widget> _getAdItems() {
    return List.generate(6, (index) => const PostCard(
      userName: 'Sponsored',
      profileImage: 'https://picsum.photos/100/100?random=1', 
      postImage: 'https://picsum.photos/400/300?random=2',
      postContent: 'Special Promo Just for You!',
      date: 'Ads',
      isAds: true, 
      adsMarket: 'Ikaw na ito!',
      hasImage: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const PostCard(
          userName: 'Roben Juanatas',
          postContent: 'Kicking off the holiday season!',
          numOfLikes: 200,
          date: 'December 2',
          profileImage: 'assets/images/icpep-blue.png',
          hasImage: true,
          postImage: 'assets/images/icpep-blue.png',
        ),
        
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: const CustomFont(text: "Advertisement / Promotion", fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        
        CarouselSlider(
          options: CarouselOptions(
            height: 400.h, 
            enableInfiniteScroll: false, 
            padEnds: false,
            viewportFraction: 0.9,
          ),
          items: _getAdItems(),
        ),

        const PostCard(
          userName: 'Cyrus Robles',
          postContent: 'Kamusta',
          numOfLikes: 2000,
          date: 'October 11',
          profileImage: 'assets/images/cyrus.jpg',
          hasImage: false,
        ),
      ],
    );
  }
}