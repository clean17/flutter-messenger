import 'package:flutter/material.dart';
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
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
