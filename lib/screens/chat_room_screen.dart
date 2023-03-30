import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();

}

class _ChatRoomScreenState extends State<ChatRoomScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("홍길동", style: Theme.of(context).textTheme.headline6,), // context는 대체 뭐람 ?
          actions: [
            Icon(FontAwesomeIcons.search, size: 20,),
            SizedBox(width: 25,),
            Icon(FontAwesomeIcons.bars ,size: 20,),
            SizedBox(width: 25,)
          ],
        ),
      ),
    );

  }
}
