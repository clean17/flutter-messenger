import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/profile_card.dart';
import 'package:flutter_kakao/models/user.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("친구"),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          ProfileCard(user: me),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text("친구"),
                SizedBox(width: 6,),
                Text("${friends.length}")
              ],
            ),
          ),
          Expanded( // 두가지 방법이 있음 주석은 첫번째 방법
            child: ListView.builder(// 한번 더 자세히 알아보면 좋을듯 // 아래와 다른 매커니즘임 이 방법은 대규모 데이터에 적합
              // 빌더를 작은 데이터에 만들면 연산장치 낭비
              itemCount: friends.length,
              itemBuilder: (context, index) => ProfileCard(user: friends[index])),
          ),

          // Expanded( // 리스트뷰가 화며을 벗어나면 안나오는듯 ? 확장시켜야함
          //   child: ListView(
          //     children: // 자식이 리스트 이므로 [] 필요없음
          //       List.generate(friends.length, (index) =>
          //         ProfileCard(user: friends[index])
          //       )
          //
          //   ),
          // )
        ],
      ),
    );
  }
}
