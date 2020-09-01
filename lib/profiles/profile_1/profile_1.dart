import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_app/profiles/profile_1/profile_provider.dart';
import 'package:profile_app/profiles/profile_2/profile_2.dart';
import 'user.dart';
import 'dart:ui';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileOne extends StatefulWidget {
  @override
  _ProfileOneState createState() => _ProfileOneState();
}

class _ProfileOneState extends State<ProfileOne> {
  Profile profile = ProfileProviderOne.getProfile();
  bool visible = false;
  bool visible2 = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds:500), () {
      setState(() {
        visible = true;
      });
    }).then((value) {
      setState(() {
        Future.delayed(Duration(milliseconds:200),(){
          visible2=true;
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          fontFamily: 'openSan',
        ),
        child: Stack(
          children: <Widget>[
            Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                body: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipPath(
                          clipper: BackgroundClipper(),
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            opacity: visible2 ? 1 : 0,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'assets/images/background.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 16),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      '${profile.user.name}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'openSan'),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.add_location,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('${profile.user.address}'),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'About',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('${profile.user.about}',
                                    style: TextStyle(color: Colors.black87)),
//                                    buildFollowersBar(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    buildPersonAvatar(),
                    buildFinalProfileBottomNavBar(),
                  ],
                )),
          ],
        ));
  }

  Widget buildFinalProfileBottomNavBar() {
    return AnimatedOpacity(
      opacity: visible2?1:0,
      duration: Duration(milliseconds:600),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -5),
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 10),
          ],
        ),
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Followers'),
                  Text('120'),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('Followers'),
                  Text('120'),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('Followers'),
                  Text('120'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack completeProfileOne() {
    return Stack(
      children: <Widget>[
        Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: Color(0xffF2EBE4),
          appBar: buildProfileAppbar(),
          body: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '${profile.user.name}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'openSan'),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.add_location,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${profile.user.address}'),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'About',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('${profile.user.about}',
                      style: TextStyle(color: Colors.black87)),
                  buildFollowersBar(),
                ],
              ),
            ),
          ),
        ),
        buildPersonAvatar(),
      ],
    );
  }

  Widget buildFollowersBar() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.white,
            offset: Offset(0, -10),
            blurRadius: 20,
            spreadRadius: 10),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Followers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('${profile.follower.toString()}'),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'Following',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('${profile.following.toString()}'),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'Friends',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('${profile.friends.toString()}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPersonAvatar() {
    double firstPositioned=250;
    double secondPositioned=280;

    return AnimatedPositioned(
      duration: Duration(milliseconds: 200),
      top: visible2?firstPositioned:secondPositioned,
      left: 20,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProfileTwo();
          }));
        },
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: visible ? 1 : 0,
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                  offset: Offset(0, 5), color: Colors.black, blurRadius: 10),
            ]),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(
                'assets/images/photo2.jpg',
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize buildProfileAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(300),
      child: AppBar(
        flexibleSpace: buildAppbarBackground(),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(
          'profile '.toUpperCase(),
          style: TextStyle(fontFamily: 'openSans'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget buildAppbarBackground() => ClipPath(
        clipper: WaveClipperOne(),
        child: Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: ExactAssetImage('assets/images/photo3.jpg'),
            fit: BoxFit.cover,
          )),
        ),
      );
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Paint paint = Paint();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height * 0.85);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BackgroundPainter extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
//    path.lineTo(0, size.height*0.35);
//    path.lineTo(size.width, size.height*0.45);
//    path.lineTo(size.width,size.height);
//    path.lineTo(0, size.height);
//    path.lineTo(0, size.height*0.25);
//    path.close();
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.45);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
