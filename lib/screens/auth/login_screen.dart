import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wechat/helper/dialogs.dart';
import '../../api/api.dart';
import '../../main.dart';
import '../home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnime = false;
  @override
  //funtion to change the value of _isAnime
  void initState() {
    super.initState();
    //this will let the animation happen after 500 ms
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isAnime = true;
      });
    });
  }

  _handleGoogleBtnClick() {
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) {
      Navigator.pop(context);
      if (user != null) {
        // log('\nUser: ${user.user}');
        // log('\nUserAdditionalInfo: ${user.additionalUserInfo}' );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      // log('\n_signInWithGoogle: $e' as num);
      Dialogs.showSnackbar(
          context, 'Something went wrong (Check Internet connection)');
      return null;
    }
  }

  //sign out function
  // _signOut() async {
  //   await APIs.auth.signOut();
  //   await GoogleSignIn().signOut();
  // }
  @override
  Widget build(BuildContext context) {
    //initializing media query for getting device sreen size
    mq = MediaQuery.of(context).size;
    return Scaffold(
      //appbar
      appBar: AppBar(
        //remove any leading
        automaticallyImplyLeading: false,
        title: const Text('Welcome to We Chat'),
      ),
      body: Stack(
        children: [
          //app logo
          AnimatedPositioned(
              top: mq.height * .15,
              width: mq.width * .5,
              right: _isAnime ? mq.width * .25 : -mq.width * .5,
              duration: Duration(seconds: 1),
              child: Image.asset('images/icon.png')),
          //google login button
          Positioned(
            bottom: mq.height * .15,
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .06,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 223, 255, 187),
                    shape: const StadiumBorder(),
                    elevation: 0.5),
                onPressed: () {
                  _handleGoogleBtnClick();
                },
                icon: Image.asset('images/google.png', height: mq.height * .03),
                label: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(text: 'Sign In with'),
                        TextSpan(
                          text: 'Google',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ]),
                )),
          )
        ],
      ),
    );
  }
}
