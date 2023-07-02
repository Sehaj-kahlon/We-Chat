import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            onPressed: () {},
            child: Icon(Icons.add_comment_rounded),
          ),
        ));
  }
}
