import 'package:flutter/material.dart';
import 'package:profile_app/profiles/profile_1/profile_1.dart';
main(){
runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: ProfileOne(),
    );
  }
}
