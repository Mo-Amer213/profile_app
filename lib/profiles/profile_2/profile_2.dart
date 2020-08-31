import 'dart:ui';
import 'package:profile_app/profiles/profile_3/profile_3.dart';

import 'user.dart';
import 'profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTwo extends StatefulWidget {
  @override
  _ProfileTwoState createState() => _ProfileTwoState();
}

class _ProfileTwoState extends State<ProfileTwo> {
  Profile profileTwo = ProfileProviderTwo.getProfile();
 bool visible=false;
 bool visible2=false;

 @override
  void initState() {
   super.initState();
 Future.delayed(Duration(milliseconds: 500),(){
   setState(() {
     visible=true;
   });
 }).then((value) {
   Future.delayed(Duration(milliseconds: 200),(){
     setState(() {
       visible2=true;
     });
   });
 });

 }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'openSan', textTheme: TextTheme()),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: build_app_bar_profile_2(context),
        body: Column(
          children: <Widget>[
            buil_backgorund_Avatar_image(context),
            build_followers_bar(),
            buildAboutDescriptionColumn(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Friends (${profileTwo.friends})",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontFamily: 'openSan'),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/images/john.jpg'),
                        ),
                      ),  Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/images/photo1.jpg'),
                        ),
                      ),  Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/images/photo1.jpg'),
                        ),
                      ),  Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/images/photo1.jpg'),
                        ),
                      ),  Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/images/photo1.jpg'),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding buildAboutDescriptionColumn() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 8),
      child: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "About Me\n\n\n".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  )),
              TextSpan(
                  text: "${profileTwo.user.about}",
                  style: TextStyle(
                      fontFamily: 'openSan',
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                      wordSpacing: 1.5)),
            ]),
          )
        ],
      ),
    );
  }

  Container build_followers_bar() {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, 3),
            color: Colors.black87.withOpacity(0.1),
            blurRadius: 5)
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Followers',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '${profileTwo.follower}'.toString(),
                style: TextStyle(
                    fontFamily: 'openSan', fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Friends',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '${profileTwo.friends}'.toString(),
                style: TextStyle(
                    fontFamily: 'openSan', fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Following',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '${profileTwo.following}'.toString(),
                style: TextStyle(
                    fontFamily: 'openSan', fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }

  Stack buil_backgorund_Avatar_image(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/john.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ProfileThree();
                }));
              },
              child: buildContainerCircularAvatar(),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '${profileTwo.user.name}\n'.toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'openSan',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                TextSpan(
                    text: "${profileTwo.user.address}",
                    style: TextStyle(fontFamily: 'openSan', wordSpacing: 1.2)),
              ]),
            )
          ],
        ),
      ],
    );
  }

  Widget buildContainerCircularAvatar() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: visible?1:0,
      child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black87,
                    image: DecorationImage(
                        image: ExactAssetImage(
                          'assets/images/photo2.jpg',
                        ),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.09),
                          offset: Offset(0, 0),
//                      blurRadius: 10,
                          spreadRadius: 10),
                      BoxShadow(
                          color: Colors.white.withOpacity(0.15),
                          offset: Offset(0, 0),
                          spreadRadius: 20)
                    ]),
              ),
    );
  }

  AppBar build_app_bar_profile_2(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: FaIcon(
          FontAwesomeIcons.bars,
        ),
      ),
      actions: <Widget>[],
    );
  }

  Scaffold buildUnusedScaffold(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.35),
        child: AppBar(
          flexibleSpace: Image.asset(
            'assets/images/photo2.jpg',
            fit: BoxFit.fill,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: FaIcon(FontAwesomeIcons.bars),
            onPressed: () {},
          ),
        ),
      ),
      body: Text('amer'),
    );
  }

  Widget contacts() {
    for (int count = 0; count < 10; count++) {
      return CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(
          'assets/images/photo1.jpg',
        ),
      );
    }
  }
}
