import '../../models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message) async {
    //get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timeStamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
        messages: message,
        receiverId: receiverId,
        senderEmail: currentUserEmail,
        senderId: currentUserId,
        timeStamp: timeStamp);

    //construct chat room id from current user id and recevier id(sorted to ensure uniquness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); //sort the ids (this ensures the chat room id is always the same for any pair of people)
    String chatRoomId = ids
        .join("_"); //combine the ids into single string to use as a chatroomId.
    //add new message to database
    await _fireStore
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //GET MESSAGES

  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    //construct chat room id from user ids(sorted to ensure it matches the id used when sending messages)
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _fireStore
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
