import 'package:chat/constants.dart';
import 'package:chat/messages/components/chat_input_field.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:flutter/material.dart';

class BodyMessagesScreen extends StatelessWidget {
  const BodyMessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: ListView.builder(
            itemCount: demeChatMessages.length,
            itemBuilder: (context, index) =>
                Message(message: demeChatMessages[index]),
          ),
        )),
        ChatInputField(),
      ],
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!message.isSender)
          CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
        TextMessage(
          message: message,
        ),
      ],
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(message.isSender ? 1 : 0.1),
            borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.only(top: kDefaultPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
        child: Text(
          message.text,
          style: TextStyle(
              color: message.isSender
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1!.color),
        ));
  }
}
