import 'user.dart';

class ProfileProviderFive {
  static Profile getProfile() {
    return Profile(
      user: User(
          photography: 'Photography',
          name: 'Erik Walters ',
          address: '213-Tanta-Egypt',
          about: " We’re also busy preparing scripts for the next two "
              "installments of our John Wick action franchise with John Wick 4 slated to hit "
              "theatres Memorial Day weekend 2022,installments of our John Wick action  "
      ),
      follower: 200,
      following: 450,
      friends: 150,
    );
  }
//this methods is just used for the Demo Version of this App

static List<String> photos(){
    return List.generate(15, (index) => 'assets/images/photo1.jpg');
}

  static List<String> videos(){
    return List.generate(15, (index) => 'assets/images/photo1.jpg');
  }
  static List<String> friends(){
    return List.generate(15, (index) => 'assets/images/photo1.jpg');
  }
  static List<String> posts(){
    return List.generate(15, (index) => 'assets/images/photo1.jpg');
  }

}
