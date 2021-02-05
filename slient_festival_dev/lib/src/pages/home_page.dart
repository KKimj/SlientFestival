import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,


        child:

        Scaffold
          (

            appBar: AppBar( //앱 바를 통해 (추천 그룹 정보)로 수정하면 될 것 같습니다.
                title: Text('조용한 파티'),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: '최신',
                    ),
                    Tab(
                      text: '그룹',
                    ),
                    Tab(
                      text: '정보',
                    ),
                  ],
                  isScrollable: true,
                )),
            body: TabBarView(children: [
              GridView.builder(
                itemCount: 50,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  //if (index < 50)
                  return InkWell(//inkwell로 클릭 동작을 하게 만들었습니다.
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: GridTile(
                          footer: Text(
                            'Item $index',
                            textAlign: TextAlign.center,
                          ),
                          header: Text(
                            'SubItem $index',
                            textAlign: TextAlign.center,
                          ),

                          child: Image.asset("test/test_logo2.jpg"),//헬스케어 앱의 이미지를 가져다 넣어보려 하였으나 실패하였습니다.ㅠㅠ
                        ),

                      ),
                      margin: EdgeInsets.all(1.0),

                    ),
                    onTap: (){
                      print("Hello");
                    },
                  );
                },
              ),
              GridView.builder(
                itemCount: 50,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  //if (index < 50)
                  return InkWell(//inkwell로 클릭 동작을 하게 만들었습니다.
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: GridTile(
                          footer: Text(
                            'Item $index',
                            textAlign: TextAlign.center,
                          ),
                          header: Text(
                            'SubItem $index',
                            textAlign: TextAlign.center,
                          ),

                          child: Image.asset("test/test_logo2.jpg"),//헬스케어 앱의 이미지를 가져다 넣어보려 하였으나 실패하였습니다.ㅠㅠ
                        ),

                      ),
                      margin: EdgeInsets.all(1.0),

                    ),
                    onTap: (){
                      print("Hello");
                    },
                  );
                },
              ),
              GridView.builder(
                itemCount: 50,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  //if (index < 50)
                  return InkWell(//inkwell로 클릭 동작을 하게 만들었습니다.
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: GridTile(
                          footer: Text(
                            'Item $index',
                            textAlign: TextAlign.center,
                          ),
                          header: Text(
                            'SubItem $index',
                            textAlign: TextAlign.center,
                          ),

                          child: Image.asset("test/test_logo2.jpg"),//헬스케어 앱의 이미지를 가져다 넣어보려 하였으나 실패하였습니다.ㅠㅠ
                        ),

                      ),
                      margin: EdgeInsets.all(1.0),

                    ),
                    onTap: (){
                      print("Hello");
                    },
                  );
                },
              ),
            ]

            ),
          bottomNavigationBar: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'home',
              ),
              Tab(
                icon: Icon(Icons.chat),
                text: 'chat',
              ),
//              Tab(
//                icon: Icon(Icons.add_a_photo),
//                text: 'add',
//              ),

                Tab(
                  icon: Icon(Icons.notifications_active),
                  text: 'noti',
                ),
//                Tab(
//                  icon: Icon(Icons.people),
//                  text: 'my',
//                )
            ],
            labelColor: Colors.blue,
          ),


        )


    );
  }
}
