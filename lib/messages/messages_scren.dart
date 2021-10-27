import 'package:chat/constants.dart';
import 'package:chat/messages/components/body.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyMessagesScreen(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(
            width: kDefaultPadding / 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hugo",
                style: TextStyle(fontSize: 16),
              ),
              Text("was active 3 min before..", style: TextStyle(fontSize: 12)),
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.local_phone)),
        IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
        SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}
