import 'package:flutter/material.dart';
import 'package:flutter_kakao/screens/profile_screen.dart';

import '../models/user.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListTile(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>
              ProfileScreen(user: user,),
            )
          );
        },
        leading: _avatar(),
        title: _title(),
        subtitle: _subtitle(),
      ),
    );
  }

  Widget _subtitle() {
    return Text(
      user.intro,
      style: TextStyle(
        fontSize: 12
      ),
    );
  }

  Widget _title() {
    return Text(
      user.name,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _avatar() {
    return CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage( // 캐시 네트워크 이미지 사용해 - 라이브러리
        user.backgroundImage
      ),
    );
  }
}
