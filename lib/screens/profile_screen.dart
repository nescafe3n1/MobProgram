import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_font.dart';
import '../widgets/custom_button.dart';
import '../widgets/post_card.dart'; 

class ProfileScreen extends StatefulWidget {
 const ProfileScreen({super.key}); 

 @override
 State<ProfileScreen> createState() => _ProfileScreenState(); 
}

class _ProfileScreenState extends State<ProfileScreen> {
 String profileName = 'Leueil Shem Naranjo';
 final String followers = '1.2K'; 
 final String following = '45'; 
 final String coverImage = 'assets/images/blm.jpg'; 
 final String aboutText =
   'A Mobile Programming student at National University. I am passionate about learning Flutter and building user interfaces.'; 

 @override
 void didChangeDependencies() {
  super.didChangeDependencies();
  final String? loggedInUser = ModalRoute.of(context)!.settings.arguments as String?;
  if (loggedInUser != null) {
   setState(() {
    profileName = loggedInUser;
   });
  }
 }

 @override
 Widget build(BuildContext context) {
  return DefaultTabController( 
   length: 3, 
   child: Container( 
    color: Colors.white, 
    child: SingleChildScrollView( 
     child: Column( 
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
       Stack( 
        clipBehavior: Clip.none, 
        children: [
         Container( 
          height: 200, 
          decoration: BoxDecoration( 
           color: Colors.grey[300], 
           image: const DecorationImage( 
            image: AssetImage('assets/images/blm.jpg'), 
            fit: BoxFit.cover, 
           ),
          ),
         ),
         Positioned( 
          bottom: -50, 
          left: ScreenUtil().setWidth(20), 
          child: Stack( 
           alignment: Alignment.center, 
           children: [
            const CircleAvatar( 
             radius: 50, 
             backgroundImage: AssetImage(CURRENT_USER_PROFILE_PIC), 
            ),
            Positioned( 
             bottom: 0, 
             right: 0, 
             child: CircleAvatar( 
              radius: 15, 
              backgroundColor: Colors.grey[300], 
              child: const Icon( 
               Icons.camera_alt, 
               size: 16, 
               color: Colors.black, 
              ),
             ),
            ),
           ],
          ),
         ),
        ],
       ),

       SizedBox(height: ScreenUtil().setHeight(55)),
       Padding( 
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)), 
        child: Column( 
         crossAxisAlignment: CrossAxisAlignment.start, 
         children: [
          CustomFont( 
           text: profileName,
           fontWeight: FontWeight.bold, 
           fontSize: ScreenUtil().setSp(20), 
           color: Colors.black, 
          ),
          SizedBox(height: ScreenUtil().setHeight(5)), 
          Row( 
           children: [
            CustomFont(text: followers, fontSize: ScreenUtil().setSp(15), color: Colors.black, fontWeight: FontWeight.bold),
            SizedBox(width: ScreenUtil().setWidth(10)), 
            CustomFont(text: 'followers', fontSize: ScreenUtil().setSp(15), color: Colors.grey, fontWeight: FontWeight.w100),
            SizedBox(width: ScreenUtil().setWidth(5)), 
            const Icon(Icons.circle, size: 5, color: Colors.grey),
            SizedBox(width: ScreenUtil().setWidth(5)), 
            CustomFont(text: following, fontSize: ScreenUtil().setSp(15), color: Colors.black, fontWeight: FontWeight.bold),
            SizedBox(width: ScreenUtil().setWidth(10)), 
            CustomFont(text: 'following', fontSize: ScreenUtil().setSp(15), color: Colors.grey, fontWeight: FontWeight.w100),
           ],
          ),
          SizedBox(height: ScreenUtil().setHeight(10)), 
          Row( 
           children: [
            CustomButton(buttonName: 'Edit Profile', onPressed: () {}),
            SizedBox(width: ScreenUtil().setWidth(10)), 
            CustomButton(buttonName: 'Message', onPressed: () {}, buttonType: 'outlined'),
           ],
          ),
         ],
        ),
       ),

       SizedBox(height: ScreenUtil().setHeight(10)), 

       const TabBar( 
        indicatorColor: FB_DARK_PRIMARY, 
        tabs: [ 
         Tab(child: Text('Posts', style: TextStyle(color: Colors.black))),
         Tab(child: Text('About', style: TextStyle(color: Colors.black))),
         Tab(child: Text('Photos', style: TextStyle(color: Colors.black))),
        ],
       ),

       SizedBox( 
        height: ScreenUtil().setHeight(1000), 
        child: TabBarView( 
         children: [
          ListView(
           physics: const NeverScrollableScrollPhysics(), 
           children: [
            PostCard(
             userName: profileName,
             postContent: 'Starting Lab Activity 5!',
             numOfLikes: 15,
             date: '5m ago',
             hasImage: false,
             profileImage: CURRENT_USER_PROFILE_PIC,
            ),
            PostCard(
             userName: profileName,
             postContent: '#AldubNationalUniversity',
             numOfLikes: 70,
             date: 'Yesterday',
             hasImage: true,
             profileImage: CURRENT_USER_PROFILE_PIC,
             postImage: 'assets/images/aldub.jpg', 
            ),
           ],
          ),

          // About Tab
          Padding(
           padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CustomFont(text: 'Personal Information', fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold, color: Colors.black),
             SizedBox(height: ScreenUtil().setHeight(10)),
             CustomFont(text: aboutText, fontSize: ScreenUtil().setSp(15), color: Colors.black87),
             const Divider(height: 30),
             const Row(
              children: [
               Icon(Icons.school, size: 20, color: Colors.grey),
               SizedBox(width: 10),
               Expanded(child: Text('Studies at National University, Manila')),
              ],
             ),
            ],
           ),
          ),

          // Photos Tab
          Padding(
           padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
           child: GridView.count( 
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: List.generate(9, (index) {
             return Image.network(
              'https://picsum.photos/200/200?random=$index',
              fit: BoxFit.cover,
             );
            }),
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