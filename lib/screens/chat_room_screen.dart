import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/other_chat.dart';
import 'package:flutter_kakao/components/time_line.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/my_chat.dart';
import '../models/chat.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();

}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final List<MyChat> chats = [];
  final TextEditingController _textEditingController = TextEditingController();

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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(  // 넌 누구?
                  child: Column(
                    children: [
                      TimeLine(time: "2023년 1월 1일 금요일"),
                      OtherChat(
                        name: "홍길동",
                      text: "새해 복 많이 받으세요",
                       time: "오전 10:10",),
                      MyChat(
                       time: "오후 2:15",
                        text: "선생님도 많이 받으십시오.",
                      ),
                      ...List.generate(chats.length, (index) => chats[index]),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
