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
 final String profileName = 'Leueil Shem Naranjo'; 
 final String followers = '1.2K'; 
 final String following = '45'; 
 final String coverImage = 'assets/images/blm.jpg'; 
 final String aboutText =
   'A Mobile Programming student at National University. I am passionate about learning Flutter and building user interfaces.'; 

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
           image: DecorationImage( 
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
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(20)), 
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

            CustomFont( 
             text: followers, 
             fontSize: ScreenUtil().setSp(15), 
             color: Colors.black, 
             fontWeight: FontWeight.bold, 
            ),
            SizedBox(width: ScreenUtil().setWidth(10)), 
            CustomFont( 
             text: 'followers', 
             fontSize: ScreenUtil().setSp(15), 
             color: Colors.grey, 
             fontWeight: FontWeight.w100, 
            ),
            SizedBox(width: ScreenUtil().setWidth(5)), 
            Icon( 
             Icons.circle, 
             size: ScreenUtil().setSp(5), 
             color: Colors.grey, 
            ),
            SizedBox(width: ScreenUtil().setWidth(5)), 

            // Following Count
            CustomFont( 
             text: following, 
             fontSize: ScreenUtil().setSp(15), 
             color: Colors.black, 
             fontWeight: FontWeight.bold, 
            ),
            SizedBox(width: ScreenUtil().setWidth(10)), 
            CustomFont( 
             text: 'following', 
             fontSize: ScreenUtil().setSp(15), 
             color: Colors.grey, 
             fontWeight: FontWeight.w100, 
            ),
           ],
          ),

          SizedBox(height: ScreenUtil().setHeight(10)), 

          Row( 
           children: [
            CustomButton( 
             buttonName: 'Edit Profile', 
             onPressed: () {}, 
            ),
            SizedBox(width: ScreenUtil().setWidth(10)), 
            CustomButton( 
             buttonName: 'Message', 
             onPressed: () {},
             buttonType: 'outlined', 
            ),
           ],
          ),
         ],
        ),
       ),

       SizedBox(height: ScreenUtil().setHeight(10)), 

       TabBar( 
        indicatorColor: FB_DARK_PRIMARY, 
        tabs: [ 
         Tab( 
          child: CustomFont( 
           text: 'Posts', 
           fontSize: ScreenUtil().setSp(15), 
           color: Colors.black, 
          ),
         ),
         Tab( 
          child: CustomFont( 
           text: 'About', 
           fontSize: ScreenUtil().setSp(15), 
           color: Colors.black, 
          ),
         ),
         Tab( 
          child: CustomFont( 
           text: 'Photos', 
           fontSize: ScreenUtil().setSp(15), 
           color: Colors.black, 
          ),
         ),
        ],
       ),

       SizedBox( 
        height: ScreenUtil().setHeight(2000), 
        child: TabBarView( 
         children: [
          ListView(
           physics: const NeverScrollableScrollPhysics(), 
           children: const [
            PostCard(
             userName: 'Leueil Shem Naranjo',
             postContent: 'Naunsa man ning code na ni oy, atay',
             numOfLikes: 15,
             date: '5m ago',
             hasImage: false,
             profileImage: CURRENT_USER_PROFILE_PIC,
            ),
            PostCard(
             userName: 'Leueil Shem Naranjo',
             postContent: '#AldubNation #MaALDENkita #aldubYOU',
             numOfLikes: 70,
             date: 'Yesterday',
             hasImage: true,
             profileImage: CURRENT_USER_PROFILE_PIC,
             postImage: 'assets/images/aldub.jpg', 
            ),
           ],
          ),

          Padding(
           padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CustomFont(
              text: 'Personal Information',
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.bold,
              color: Colors.black,
             ),
             SizedBox(height: ScreenUtil().setHeight(10)),
             CustomFont(
              text: aboutText,
              fontSize: ScreenUtil().setSp(15),
              color: Colors.black87,
             ),
             const Divider(height: 30),
             
             Row(
              children: [
               const Icon(Icons.school, size: 20, color: Colors.grey),
               SizedBox(width: ScreenUtil().setWidth(10)),
               Expanded(
                child: CustomFont(
                 text: 'Studies BS Information Technology at National University, Manila',
                 fontSize: ScreenUtil().setSp(15),
                 color: Colors.black,
                ),
               ),
              ],
             ),
             SizedBox(height: ScreenUtil().setHeight(10)),
             
             Row(
              children: [
               const Icon(Icons.home, size: 20, color: Colors.grey),
               SizedBox(width: ScreenUtil().setWidth(10)),
               Expanded(
                child: CustomFont(
                 text: 'Lives in Quezon City, Philippines',
                 fontSize: ScreenUtil().setSp(15),
                 color: Colors.black,
                ),
               ),
              ],
             ),
            ],
           ),
          ),

          Padding(
           padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
           child: GridView.count( 
            crossAxisCount: 3,
            crossAxisSpacing: ScreenUtil().setWidth(5),
            mainAxisSpacing: ScreenUtil().setWidth(5),
            children: List.generate(15, (index) {
             return Image.network(
              'https://picsum.photos/200/200?random=${index + 10}',
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