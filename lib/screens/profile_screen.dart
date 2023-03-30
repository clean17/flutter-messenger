import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/bottom_icon_button.dart';
import 'package:flutter_kakao/components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(user.backgroundImage),
          fit: BoxFit.fitHeight,
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // 그림자 색상
                  spreadRadius: -5, // 그림자 전체 크기를 얼마나 확장시킬 것인지
                  blurRadius: 0, // 그림자의 흐림 정도를 설정합니다.
                  offset: Offset(0, 1), // 그림자 위치 조정을 위한 오프셋 값
                  // 오프셋 설정 ?
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.times,
                size: 30,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.pop(context); // 나 자신인듯?
              },
            ),
          ),
          actions: [
            RoundIconButton(
              icon: FontAwesomeIcons.gift,),
            SizedBox(width: 15,),
            RoundIconButton(
              icon: FontAwesomeIcons.cog ,),
            SizedBox(width: 20,)
          ],
        ),
        body: Column(
          children: [
            Spacer(),
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(user.backgroundImage),
                  fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(height: 8,),
            Text(user.name, style: TextStyle(
              color: Colors.white, fontSize: 20
            ),),
            Text(user.intro, style: TextStyle(
              color: Colors.white, fontSize: 15
            ),),
            if( user.name == me.name ) _buildMyIcons() else _buildFriendIcons(),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      
    );
  }

  Widget _buildMyIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(icon: FontAwesomeIcons.comment, text: "나와의채팅"),
          SizedBox(width: 50,),
          BottomIconButton(icon: FontAwesomeIcons.pen, text: "프로필 편집"),
        ],
      ),
    );
        
  }

  Widget _buildFriendIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(icon: FontAwesomeIcons.comment, text: "1:1 채팅"),
          SizedBox(width: 50,),
          BottomIconButton(icon: FontAwesomeIcons.phone, text: "통화하기")
        ],
      ),
    );
  }
}
