import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_bubble_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Rozak', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              reverse: true,
              padding: const EdgeInsets.all(10),
              children: const [
                // Chat room messages here
                ChatBubble(
                  direction: Direction.left,
                  message: 'Haloooo',
                  photoUrl: null,
                  type: BubbleType.alone,
                ),
                ChatBubble(
                  direction: Direction.right,
                  message: 'Haloooo',
                  photoUrl: null,
                  type: BubbleType.alone,
                ),
                ChatBubble(
                  direction: Direction.left,
                  message: 'Haloooo',
                  photoUrl: null,
                  type: BubbleType.alone,
                ),
                ChatBubble(
                  direction: Direction.right,
                  message: 'Haloooo',
                  photoUrl: null,
                  type: BubbleType.alone,
                ),
                ChatBubble(
                  direction: Direction.left,
                  message: 'Haloooo',
                  photoUrl: null,
                  type: BubbleType.alone,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Send message logic here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
