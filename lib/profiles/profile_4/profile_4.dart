import 'package:flutter/material.dart';
import 'package:profile_app/profiles/profile_4/profile_provider.dart';
import 'package:profile_app/profiles/profile_4/user.dart';

class ProfileFour extends StatefulWidget {
  @override
  _ProfileFourState createState() => _ProfileFourState();
}

class _ProfileFourState extends State<ProfileFour> {
  Profile profileFour = ProfileProviderFour.getProfile();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'openSan'),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              actions: <Widget>[
                IconButton(icon: Icon(Icons.more_vert), onPressed:(){}),
              ],
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
              buildBackgroundContainer(),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.all(10),
                child: Container(
                 height: MediaQuery.of(context).size.height * 0.45,
                 width: double.infinity,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: <Widget>[
                       buildCardRowOne(),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           ...about(),
                         ],
                       ),
                       buildFollowersBarProfile4('Follower', 'Friends', 'Following')
                     ],
                   ),
                 ),
                  ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  List<Widget> about() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text('About'),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          profileFour.user.name,
          style: TextStyle(
              color: Colors.grey.shade900, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(profileFour.user.photography),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(
          profileFour.user.about,
          style: TextStyle(fontSize: 15),
        ),
      ),
    ];
  }


  Row buildFollowersBarProfile4(
      String follower, String following, String friends) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '$follower\n\n',
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.normal)),
            TextSpan(
                text: '${profileFour.follower}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16))
          ]),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '$following\n\n',
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.normal)),
            TextSpan(
                text: '${profileFour.friends}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16))
          ]),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '$friends\n\n',
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.normal)),
            TextSpan(
                text: '${profileFour.following}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      ],
    );
  }




  Row buildCardRowOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/photo2.jpg',
          ),
          radius: 30,
        ),
        SizedBox(
          width: 16,
        ),
        creatingAddFriendBtn('add friend', Colors.white),
        creatingAddFriendBtn(
          'follow',
          Colors.grey.shade600,
          fontColor: Colors.white,
        ),
      ],
    );
  }

  FlatButton creatingAddFriendBtn(String title, Color backgroundColor,
      {Color fontColor}) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      onPressed: () {},
      color: backgroundColor,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(color: fontColor),
      ),
    );
  }

  Container buildBackgroundContainer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage(
                'assets/images/photo1.jpg',
              ),
              fit: BoxFit.fill)),
    );
  }
}
