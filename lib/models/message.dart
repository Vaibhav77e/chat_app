import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  //final String receiverEmail;
  final String messages;
  final Timestamp timeStamp;

  Message(
      {required this.messages,
      //  required this.receiverEmail,
      required this.receiverId,
      required this.senderEmail,
      required this.senderId,
      required this.timeStamp});

  //convert to a map so that can be stored in firestore

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      //  'receiverEmail':receiverEmail,
      'message': messages,
      'timestamp': timeStamp,
    };
  }
}
