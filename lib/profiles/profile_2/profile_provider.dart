import 'user.dart';

class ProfileProviderTwo {
  static getProfile() {
    return Profile(
      user: User(
          name: 'John Wick',
          address: ' 677 Adams Bypass',
          image: 'assets/images/photo1.jpg',
          about:
              "Given the visual and sometimes audio  present in many popular web pages, you probably realize that the simple pages described in this"
              "hour are only the tip of the HTML iceberg. Now that you know the basics,"
              "you might surprise yourself with how much of the rest you can pick up"
              "just by looking at other people’s pages on the Internet. You can see the"
              "HTML for any page by right-clicking and selecting View Source in any"
              "   web browser"),
      following: 210,
      follower: 500,
      friends: 432
    );
  }
}
