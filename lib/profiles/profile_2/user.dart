class User {
  String image, name, address, about;

  User({this.image, this.name, this.address, this.about});
}

class Profile {
  User user;
  int follower, following, friends;

  Profile({this.user, this.follower, this.following, this.friends});
}
