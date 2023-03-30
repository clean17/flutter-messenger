import 'package:flutter/material.dart ';
import 'package:flutter_kakao/screens/chat_room_screen.dart';

import '../models/chat.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key, required this.chat}) : super(key: key);

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChatRoomScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(chat.image),
                ),
                title: Text(
                  chat.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(chat.content),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
            Column(
              children: [
                Text(
                  chat.time,
                  style: TextStyle(color: Colors.black38, fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                if (chat.count != "0") Container(
                  // 내부 패딩은 내부 공간을 설정한다. 내부 공간을 추가하여 더 넓은 공간으로 만들 수 있다.
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent
                  ),
                  child: Text(chat.count,
                  style: TextStyle(fontSize: 12, color: Colors.white),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
