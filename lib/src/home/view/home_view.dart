import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test2/src/auth/models/user_model.dart';
import 'package:flutter_application_test2/src/auth/view/login_screen_view.dart';
import 'package:flutter_application_test2/src/chat/views/chat_screen_view.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var senderName = "ahmed";
  @override
  Widget build(BuildContext context) {
    List users = [];
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          "Let's Chat",
          // "Let's Chat, ${currentUser.fullName}",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('SignOut'),
              onTap: () {
                _auth.signOut();
                Get.offAll(() => LoginScreenView());
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => ChatScreenView(
                    //           users[index].fullName,
                    //           users[index].image,
                    //         )));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: ListTile(
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://media.gettyimages.com/id/1227618794/vector/human-face-avatar-icon-profile-for-social-network-man-vector-illustration.jpg?s=1024x1024&w=gi&k=20&c=o_oUl-hA5RjN33CmmUQ_hgYQSIpGFeqatw0TLZzDQb0=")),
                          title: Text(
                            users[index].fullName,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ChatScreenView()));
          },
          icon: Icon(Icons.message)),
    );
  }
}
