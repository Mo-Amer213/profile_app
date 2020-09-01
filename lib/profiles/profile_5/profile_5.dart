import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:profile_app/profiles/profile_5/user.dart';
import 'package:profile_app/profiles/profile_5/profile_provider.dart';

class ProfileFive extends StatefulWidget {
  @override
  _ProfileFiveState createState() => _ProfileFiveState();
}

class _ProfileFiveState extends State<ProfileFive>
    with SingleTickerProviderStateMixin {
  Profile profileFive = ProfileProviderFive.getProfile();
  bool visible = false;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, initialIndex: 0, vsync: this);

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'openSan'),
      child: Scaffold(
        appBar: buildAppBarProfile5(context),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              profileDetails(context),
              profileContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16),
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: ExactAssetImage('assets/images/john.jpg'),
                  fit: BoxFit.cover)),
        ),
        Text(
          profileFive.user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        Text(profileFive.user.photography),
        buildFollowBtn(),
      ],
    );
  }

  Widget buildFollowBtn() {
    return AnimatedPadding(
      duration: Duration(milliseconds: 100),
      padding: visible
          ? const EdgeInsets.symmetric(vertical: 32)
          : const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 150,
        height: 40,
        child: RaisedButton(
          elevation: 0,
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

  AppBar buildAppBarProfile5(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {})
      ],
    );
  }

  Widget profileContent(BuildContext context) {
    return Flexible(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black12),
                    bottom: BorderSide(color: Colors.black12))),
            child: TabBar(
              unselectedLabelColor: Colors.black45,
              indicatorWeight: 2,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 32),
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              controller: tabController,
              tabs: <Widget>[
                Tab(
                  text: 'photos'.toUpperCase(),
                ),
                Tab(
                  text: 'videos'.toUpperCase(),
                ),
                Tab(
                  text: 'posts'.toUpperCase(),
                ),
                Tab(
                  text: 'friends'.toUpperCase(),
                ),
              ],
            ),
          ),
          Flexible(
            // using Flexible here is required for TabBarView to extend and take all the
            // available space  remained from the parent Widget
            child: TabBarView(controller: tabController, children: [
              _photos(context),
              _videos(),
              friends(),
              posts(),
            ]),
          )
        ],
      ),
    );
  }

  Widget _photos(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: ProfileProviderFive.photos().map( (photo) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image:ExactAssetImage('assets/images/photo2.jpg'),fit: BoxFit.cover),
            borderRadius:BorderRadius.all(Radius.circular(10),),
          ),
          margin: EdgeInsets.all(10),

        );
      }).toList(),
    );
  }

  Widget _videos() {
    return GridView.count(
      crossAxisCount: 3,
      children: ProfileProviderFive.friends().map((friend) {
        return Container(
          child: Text('Widget ua_amer '),
        );
      }).toList(),
    );
  }

  Widget posts() {
    return Container();
  }

  Widget friends() {
    return Container();
  }

  GridView usingGridViewOld() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/images/photo2.jpg')),
              borderRadius: BorderRadius.all(Radius.circular(8))),
//          margin: EdgeInsets.all(10),
          child: Image.asset(
            'assets/images/john.jpg',
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: 12,
    );
  }
}
