import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class Feed extends StatelessWidget {

  String date = "2021/02/06";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: <Widget>[
          feed(1, 'userimage', 'assets/1.jpg', '12', date),
          feed(2, 'userimage', 'assets/2.jpg', '34', date),
          feed(3, 'userimage', 'assets/3.jpg', '56', date),
          feed(4, 'userimage', 'assets/4.jpg', '78', date),
        ],
      ),
    );
  }
}

Widget feed(int id, String userimage, String contentimage, String content, var _date){//유저아이디, 유저이미지주소, 넣을 이미지 주소, 내용들을 서버에서 끌어와서 쓰면 됩니다.
  return Container(
            decoration: BoxDecoration(color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.withOpacity(.3)))
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/users/person1.jpg'),//넣을 이미지 주소를 끌어와서 바꾸면 됩니다.
                      ),
                      title: Text('alexs',style: TextStyle(color: Colors.black.withOpacity(.8),fontWeight: FontWeight.w400,fontSize: 21),),//유저아이디를 통해 이름을 바꾸면 됩니다.

                    ),
                    Image.asset(contentimage,fit: BoxFit.cover,width:double.infinity,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                          Icon(Icons.favorite_border,size:31),
                          SizedBox(width: 12,),
                          Icon(FontAwesomeIcons.solidComment,size:31),
                          SizedBox(width: 12,),
                            ],
                          ),
                          Text(
                            _date,
                          )
                        ],
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                        child: Text(content,style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(.8)),),
                      )
              ],
            ),
          );
}