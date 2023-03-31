import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/chat_icon_button.dart';
import 'package:flutter_kakao/components/other_chat.dart';
import 'package:flutter_kakao/components/time_line.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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
            ),  // 익스펜디드가 존재하므로 나머지 영역을 벽에 붙어서 만듦
            Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  ChatIconButton(icon: Icon(FontAwesomeIcons.plusSquare)),
                  Expanded(
                    child: Container(
                      child: TextField( // 이 속성은 ? 영역을 필요로 하는가 ?
                        controller: _textEditingController, // 알아봐
                        maxLines: 1, // 옆으로 길어질듯 ?
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration( // 이것도 알아보구
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onSubmitted: _handleSubmitted,   // 이 옵션 공부좀
                    )
                    ),
                  ),
                  ChatIconButton(icon: Icon(FontAwesomeIcons.smile)), // 위에 익스펜디드가 영역 다 먹음 
                  ChatIconButton(icon: Icon(FontAwesomeIcons.cog)),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(text) {
    _textEditingController.clear(); // 전송하면 비워줌

    setState(() {
      chats.add(  // 생성자로 만들고 추가 - 다시그림 )
        MyChat(text: text, time: DateFormat("a k:m").format(new DateTime.now()) // "a k:m" 은 뭐임 ? - int 패키지를 이용한 날짜 포맷 ?
                                      .replaceAll("AM", "오전")
                                      .replaceAll("PM", "오후"),
        ),
      );
    });
  }
}
