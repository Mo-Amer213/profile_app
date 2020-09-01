import 'user.dart';

class ProfileProviderFour {
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
}
