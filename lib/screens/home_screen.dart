import 'package:flutter/material.dart';

//strateful widget so that we can change it dynamically
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
          leading: Icon(Icons.home),
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
