import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// MyApp을 시작 위젯으로 설정하여 앱을 실행

// 앱의 시작점에 해당하는 위젯
class RatingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 매트리얼앱을 생성하여 반환
    return Scaffold(
          appBar: AppBar(
            title: Text("Flutter layout demo"),
          ),
          body: Column( // 컬럼으로 교체
            // 자식들을 추가
            children: <Widget>[
              pictureplace,
              titleSection,
              commentSection1,
              commentSection2 // titleSection 컨테이너 추가
            ],
          ),

    );
  }

  Widget pictureplace = Container( //장소 사진입니다
    // 수평적으로 대칭(symmetric)의 마진을 추가 -> 화면 위, 아래에 20픽세의 마진 삽입
    margin: EdgeInsets.all(20.0),
    // 컨테이너의 높이를 200으로 설정
    height: 200.0,
    // 리스트뷰 추가
    child: ListView(
      // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
      scrollDirection: Axis.horizontal,
      // 컨테이너들을 ListView의 자식들로 추가
      children: <Widget>[
        Container(
          width: 160.0,
          margin: EdgeInsets.all(10.0),
          color: Colors.red,
        ),
        Container(
          width: 160.0,
          margin: EdgeInsets.all(10.0),
          color: Colors.blue,
        ),
        Container(
          width: 160.0,
          margin: EdgeInsets.all(10.0),
          color: Colors.green,
        ),
        Container(
          width: 160.0,
          margin: EdgeInsets.all(10.0),
          color: Colors.yellow,
        ),
        Container(
          width: 160.0,
          margin: EdgeInsets.all(10.0),
          color: Colors.orange,
        )
      ],
    ),
  );

  // 컨테이터 위젯 구현
  Widget titleSection = Container( //장소 정보입니다
    // 컨테이너 내부 상하좌우에 32픽셀만큼의 패딩 삽입
    padding: const EdgeInsets.all(32),
    // 자식으로 로우를 추가
    child: Row(
      // 로우에 위젯들(Expanded, Icon, Text)을 자식들로 추가
      children: <Widget>[
        // 첫번째 자식
        Expanded(
          // 첫번째 자식의 자식으로 컬럼 추가
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 자식들을 왼쪽정렬로 배치함
            // 컬럼의 자식들로 컨테이너와 텍스트를 추가
            children: <Widget>[
              // 컬럼의 첫번째 자식 컨테이너
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                // 컨테이너 내부 하단에 8픽셀만큼 패딩 삽입
                child: Text( // 컨테이너의 자식으로 텍스트 삽입
                  "갈마살롱",
                  style: TextStyle(
                      fontWeight: FontWeight.bold // 텍스트 강조 설정
                  ),

                ),
              ),
              // 컬럼의 두번째 자식으로 텍스트 삽입
              Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        "27,372",
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(width: 10.0,),
                      Icon(
                        Icons.star,
                        color: Colors.pink,
                        size: 24.0,
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        "50",
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(width: 10.0,),
                      Icon(
                        Icons.edit,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      Text(
                        "1",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  )
              ),

              Text(
                '서울특별시 강남구 도곡동 ',
                style: TextStyle(
                    color: Colors.grey[500] // 텍스트의 색상을 설정
                ),
              )
            ],
          ),
        ),
        // 두번째 자식 아이콘
        RatingBar.builder(
          initialRating: 4.5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) =>
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
      ],
    ),
  );


  Widget commentSection1 = Container( // comment 부분입니다
    // 컨테이너 내부 상하좌우에 32픽셀만큼의 패딩 삽입
    padding: const EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        // 첫번째 자식
        Expanded(
          // 첫번째 자식의 자식으로 컬럼 추가
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 자식들을 왼쪽정렬로 배치함
            // 컬럼의 자식들로 컨테이너와 텍스트를 추가
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                // 컨테이너 내부 하단에 8픽셀만큼 패딩 삽입
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // 컨테이너의 자식으로 텍스트 삽입
                  children: <Widget>[
                    RatingBar.builder(
                      initialRating: 4.5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) =>
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image.asset("assets/test1.jpg"),
                          Image.asset("assets/test1.jpg"),
                        ],
                      ),
                    ),

                  ],

                ),

              ),

            ],
          ),
        ),
        // 두번째 자식 아이콘
        Container(
            child: Row(
              children: <Widget>[
                Container(
                  color: Colors.grey.withOpacity(0.5),
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.thumb_up,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      Text(
                        "추천",
                        style: TextStyle(
                            color: Colors.grey[500] // 텍스트의 색상을 설정
                        ),
                      ),

                      SizedBox(width: 5.0,),


                    ],
                  ),
                ),
                SizedBox(width: 5,),
                Container(
                  color: Colors.grey.withOpacity(0.5),
                  padding: EdgeInsets.all(7.5),
                  child: Text(
                    "신고",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),

              ],
            )
        ),


      ],
    ),
  );

  Widget commentSection2 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '서울특별시 강남구 도곡동 ',
            style: TextStyle(
                color: Colors.grey[500] // 텍스트의 색상을 설정
            ),
          ),
        ],
      )
  );

}
