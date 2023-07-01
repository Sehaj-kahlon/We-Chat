import 'package:flutter/material.dart';
import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      //appbar
      appBar: AppBar(
        //remove any leading
        automaticallyImplyLeading: false,
        title: const Text('Welcome to We Chat'),
      ),
      //place stack any where on the screen
      body: Stack(
        //posiotiones can be used to position in anywhere on the screen
        children: [
          Positioned(
              top: mq.height * .15,
              width: mq.width * .5,
              left: mq.width * .25,
              child: Image.asset('images/icon.png')),
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
                onPressed: () {},
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
