import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat UI',
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(text: "Hi Sir", isMe: false),
    Message(text: "What are we going to make today", isMe: false),
    Message(text: "Hi Awab!", isMe: true),
    Message(text: "we are making a Chat application", isMe: true),
    Message(text: "What is this application going to do", isMe: false),
    Message(text: "It'll simulate the UI of a chat application", isMe: true),
    Message(text: "That sounds funnn", isMe: false),
    Message(text: "but how are we going make it", isMe: false),
    Message(
      text: "we are going to use the following Widget :",
      isMe: true,
    ),
    Message(
      text: "ListView, Container, Align",
      isMe: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ChatBubble(message: messages[index]);
        },
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

class ChatBubble extends StatelessWidget {
  final Message message;

  ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final alignment =
        message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bgColor = message.isMe ? Colors.blue : Colors.grey.shade300;
    final textColor = message.isMe ? Colors.white : Colors.black;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft:
                  message.isMe ? Radius.circular(16) : Radius.circular(0),
              bottomRight:
                  message.isMe ? Radius.circular(0) : Radius.circular(16),
            ),
          ),
          child: Text(
            message.text,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
