import './pages/chat_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './auth_gate/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const routeNamed = '/home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signOut() {
    try {
      Provider.of<FirebaseMethods>(context, listen: false).signOut();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Home'),
          actions: [
            IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
          ],
        ),
        body: _buildUserList());
  }

// build a list of users except for current user logged(ie.me) in as user
  Widget _buildUserList() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItems(doc))
                .toList(),
          );
        });
  }

  //build individual user list items
  Widget _buildUserListItems(DocumentSnapshot documnet) {
    Map<String, dynamic> data = documnet.data()! as Map<String, dynamic>;

    //display all users except current uer
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(
          data['email'],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                      receiverUserEmail: data['email'],
                      receiverUserId: data['uid'])));
        },
      );
    } else {
      return Container();
    }
  }
}
