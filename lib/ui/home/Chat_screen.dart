import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = 'chat';

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    ));
  }
}
