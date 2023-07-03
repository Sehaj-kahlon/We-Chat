import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wechat/api/api.dart';

import '../main.dart';
import '../widgets/chat_user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _signOut() async {
    await APIs.auth.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        leading: Icon(CupertinoIcons.home),
        title: const Text('We Chat'),
        actions: [
          //search user button
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          //more features button
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      //floating button to add new user
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () async {
            await APIs.auth.signOut();
            await GoogleSignIn().signOut();
            ;
          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),
      body: ListView.builder(
          itemCount: 1,
          padding: EdgeInsets.only(top: mq.height * 0.01),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return const ChatUserCard();
          }),
    );
  }
}
