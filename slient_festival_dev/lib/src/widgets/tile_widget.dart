import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(//inkwell로 클릭 동작을 하게 만들었습니다.
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Image.asset("test/test_logo2.jpg"),
        ),
        margin: EdgeInsets.all(1.0),

      ),
      onTap: (){
        print("Hello");
      },
    );
  }
}
