import 'package:cached_network_image/cached_network_image.dart';
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
  
  final String networkCoverImage = 'https://picsum.photos/800/400?random=cover'; 
  final String networkProfileImage = 'https://picsum.photos/200/200?random=user';

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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView( 
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Stack( 
                clipBehavior: Clip.none, 
                children: [
                  SizedBox(
                    height: 200.h,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: networkCoverImage,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(color: Colors.grey[300]),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),

                  Positioned( 
                    bottom: -50, 
                    left: 20.w, 
                    child: Stack( 
                      alignment: Alignment.center, 
                      children: [
                        CircleAvatar( 
                          radius: 50.w, 
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: networkProfileImage,
                              width: 100.w,
                              height: 100.w,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.person),
                            ),
                          ),
                        ),
                        Positioned( 
                          bottom: 0, 
                          right: 0, 
                          child: CircleAvatar( 
                            radius: 15.w, 
                            backgroundColor: Colors.grey[300], 
                            child: Icon(Icons.camera_alt, size: 16.sp, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 55.h), 
              Padding( 
                padding: EdgeInsets.symmetric(horizontal: 20.w), 
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    CustomFont(text: profileName, fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.black),
                    SizedBox(height: 5.h), 
                    Row( 
                      children: [
                        CustomFont(text: followers, fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold),
                        SizedBox(width: 10.w), 
                        CustomFont(text: 'followers', fontSize: 15.sp, color: Colors.grey),
                        SizedBox(width: 5.w), 
                        Icon(Icons.circle, size: 5.sp, color: Colors.grey),
                        SizedBox(width: 5.w), 
                        CustomFont(text: following, fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold),
                        SizedBox(width: 10.w), 
                        CustomFont(text: 'following', fontSize: 15.sp, color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: 10.h), 
                    Row( 
                      children: [
                        CustomButton(buttonName: 'Edit Profile', onPressed: () {}),
                        SizedBox(width: 10.w), 
                        CustomButton(buttonName: 'Message', onPressed: () {}, buttonType: 'outlined'),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h), 
              TabBar( 
                indicatorColor: FB_DARK_PRIMARY, 
                tabs: [ 
                  Tab(child: CustomFont(text: 'Posts', fontSize: 15.sp, color: Colors.black)),
                  Tab(child: CustomFont(text: 'About', fontSize: 15.sp, color: Colors.black)),
                  Tab(child: CustomFont(text: 'Photos', fontSize: 15.sp, color: Colors.black)),
                ],
              ),

              SizedBox( 
                height: 1000.h, 
                child: TabBarView( 
                  children: [
                    ListView(
                      physics: const NeverScrollableScrollPhysics(), 
                      children: [
                        PostCard(
                          userName: profileName,
                          postContent: 'Updating my profile with network URLs!',
                          numOfLikes: 15,
                          date: '5m ago',
                          profileImage: networkProfileImage,
                        ),
                        PostCard(
                          userName: profileName,
                          postContent: 'Everything is cached now. #Flutter',
                          numOfLikes: 70,
                          date: 'Yesterday',
                          profileImage: networkProfileImage,
                          postImage: 'https://picsum.photos/400/300?random=3', 
                          hasImage: true,
                        ),
                      ],
                    ),

                    const Center(child: Text("About Section")),

                    Padding(
                      padding: EdgeInsets.all(5.w),
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5.w,
                        mainAxisSpacing: 5.w,
                        children: List.generate(15, (index) {
                          return CachedNetworkImage(
                            imageUrl: 'https://picsum.photos/200/200?random=$index',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(color: Colors.grey[200]),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
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