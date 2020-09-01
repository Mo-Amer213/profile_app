import 'package:flutter/material.dart';
import 'package:profile_app/profiles/profile_1/profile_provider.dart';
import 'package:profile_app/profiles/profile_3/profile_provider.dart';
import 'package:profile_app/profiles/profile_3/user.dart';
import 'package:profile_app/profiles/profile_4/profile_4.dart';

class ProfileThree extends StatefulWidget {
  @override
  _ProfileThreeState createState() => _ProfileThreeState();
}

class _ProfileThreeState extends State<ProfileThree> {
  Profile profileThree = ProfileProviderThree.getProfile();
bool visible=false;
bool visible2=false;
@override
  void initState() {
    super.initState();
setState(() {
  Future.delayed(Duration(milliseconds: 500),(){
    setState(() {
      visible=true;
    });
  }).then( (value){
    setState(() {
      Future.delayed(Duration(milliseconds: 100),(){
        visible2=true;
      });
    });
  } );
});

  }
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
                      buildListViewPictures(),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('About'),
                          SizedBox(height:40,),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: visible?1:0,
                            child: Text("some Text and this is just a Demo for a profile app ua_amer do and we don't add any functionality yet ya Potter\n"
                                "some Text and this is just a Demo for a profile app ua_amer do and we don't add any functionality yet ya Potter\n"
                                "some Text and this is just a Demo for a profile app ua_amer do and we don't add any functionality yet ya Potter\n"
                                "some Text and this is just a Demo for a profile app ua_amer do and we don't add any functionality yet ya Potter\n",style: TextStyle(fontFamily: 'openSan',wordSpacing: 2,letterSpacing: 1.5),),
                          )
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
            buildCircularAvatarContainerProfile3(context),
          ],
        ),
      ),
    );
  }

  Widget buildListViewPictures() {
    return Container(
                      width: double.infinity,
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            10,
                            (index) => AnimatedContainer(
                              curve: Curves.bounceOut,
                              duration: Duration(milliseconds: 400),
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
                    );
  }

  Widget buildCircularAvatarContainerProfile3(BuildContext context) {
    double firstPosition=MediaQuery.of(context).size.height*0.2;
    double secondPosition=MediaQuery.of(context).size.height*0.2-50;

    return AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              top: visible?secondPosition:firstPosition,
              left: MediaQuery.of(context).size.width / 2 - 30,
//              right: MediaQuery.of(context).size.width/2-50,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ProfileFour();
                  }));
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage('assets/images/photo2.jpg'),
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
                ),
              ));
  }

  Widget buildBackgroundContainerProfile3(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
            curve: Curves.bounceOut,
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

  Widget buildProfileName() {
    return AnimatedOpacity(
     duration: Duration(milliseconds: 200),
      opacity: visible?1:0,
      child: Text(
        profileThree.user.name,
        style: TextStyle(
            color: Colors.black,
            fontFamily: 'openSan',
            fontSize: visible?16:8,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildFollowBtn() {

    return AnimatedPadding(
      duration: Duration(milliseconds: 500),
      padding: visible?const EdgeInsets.symmetric(vertical: 32):const EdgeInsets.symmetric(vertical:8),
      child: SizedBox(
        width: 150,
        height:40,
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
