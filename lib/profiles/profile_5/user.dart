import 'package:flutter/material.dart';
class User {
  String name, address, about,photography;
  User({this.name,this.address,this.about,this.photography});
}

class Profile{
  User user;
  int follower,following,friends;
  Profile({this.user,this.follower,this.following,this.friends});
}
