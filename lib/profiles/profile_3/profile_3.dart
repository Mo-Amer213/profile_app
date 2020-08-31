import 'package:flutter/material.dart';
import 'package:profile_app/profiles/profile_1/profile_provider.dart';
import 'package:profile_app/profiles/profile_3/profile_provider.dart';
import 'package:profile_app/profiles/profile_3/user.dart';

class ProfileThree extends StatefulWidget {
  @override
  _ProfileThreeState createState() => _ProfileThreeState();
}

class _ProfileThreeState extends State<ProfileThree> {
  Profile profileThree = ProfileProviderThree.getProfile();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'openSan',
      ),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            buildBackgroundContainerProfile3(context),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2, left: 16, right: 16),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      buildProfileName(),
                      buildFollowBtn(),
                      buildFollowersBarProfile3(
                          "Followers", "Following", "Friends"),
                      Divider(
                        height: 20,
                        color: Colors.black,
                      ),
                      Container(
                        width: double.infinity,
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              10,
                              (index) => Container(
                                    margin: EdgeInsets.only(bottom: 16,top: 8,right: 8),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                          image: ExactAssetImage(
                                              'assets/images/photo3.jpg'),
                                          fit: BoxFit.cover),
                                    ),
                                  )).toList(),
                        ),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('About'),
                          SizedBox(height:40,),
                          Text("some Text and this is just a Demo for a profile app ua_amer do and we don't add any functionality yet ya Potter\n"
                              "some Text and this is just a Demo for a profile app ua_amer do and we don't add any functionality yet ya Potter\n"
                              "some Text and this is just a Demo for a profile app ua_amer do and we don't add any functionality yet ya Potter\n"
                              "some Text and this is just a Demo for a profile app ua_amer do and we don't add any functionality yet ya Potter\n",style: TextStyle(fontFamily: 'openSan',wordSpacing: 2,letterSpacing: 1.5),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height*0.2-40,
                left: MediaQuery.of(context).size.width / 2 - 30,
//              right: MediaQuery.of(context).size.width/2-50,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage('assets/images/photo1.jpg'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 5)
                      ]),
//                child: CircleAvatar(
//                  radius: 35,
//                  backgroundImage: AssetImage('assets/images/photo2.jpg',),),
                )),
          ],
        ),
      ),
    );
  }

  Container buildBackgroundContainerProfile3(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/photo5.jpg'),
                    fit: BoxFit.cover)),
          );
  }

  Row buildFollowersBarProfile3(
      String follower, String following, String friends) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '$follower\n',
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.normal)),
            TextSpan(
                text: '${profileThree.follower}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16))
          ]),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '$following\n',
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.normal)),
            TextSpan(
                text: '${profileThree.friends}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16))
          ]),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '$friends\n',
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.normal)),
            TextSpan(
                text: '${profileThree.following}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      ],
    );
  }

  Text buildProfileName() {
    return Text(
      profileThree.user.name,
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'openSan',
          fontSize: 16,
          fontWeight: FontWeight.bold),
    );
  }

  Widget buildFollowBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: SizedBox(
        width: 150,
        height: 40,
        child: RaisedButton(
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          color: Colors.red.shade700,
          onPressed: () {},
          child: Text(
            'Follow',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'openSan'),
          ),
        ),
      ),
    );
  }
}
