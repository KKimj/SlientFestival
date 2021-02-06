import 'package:flutter/material.dart';
import 'package:slientfestival/src/pages/Feed_page.dart';
import 'package:slientfestival/src/pages/rating_page.dart';
import 'package:slientfestival/src/pages/stt_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> images = [
    "https://cdn.pixabay.com/photo/2014/08/20/15/21/good-422550_960_720.jpg",
    "https://cdn.pixabay.com/photo/2014/11/22/17/36/hands-541830_960_720.jpg",
    "https://t1.daumcdn.net/cfile/blog/13479E354CCBEE0E48",
    "http://image.kmib.co.kr/online_image/2020/0324/611711110014397003_1.jpg",
    "http://www.babytimes.co.kr/news/photo/201405/20140527191019_9621.jpg",
    "http://www.dtoday.co.kr/news/photo/201704/248870_164618_0639.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,


        child:

        Scaffold
          (
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>
              [
                Tab(
                  icon: Icon(Icons.home),
                  text: '홈',
                ),
                Tab(
                  icon: Icon(Icons.chat),
                  text: '홈',
                ),
                RaisedButton(
                    child: Tab(
                      icon: Icon(Icons.fiber_manual_record),
                      text: '바로번역',
                    ),
                    onPressed: ()
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SttPage()));
                    }
                ),

                Tab(
                  icon: Icon(Icons.notifications_active),
                  text: '홈',
                ),
                Tab(
                  icon: Icon(Icons.account_circle),
                  text: '내정보',
                ),

              ],
            ),
            color: Colors.blueGrey,
          ),

            appBar: AppBar( //앱 바를 통해 (추천 그룹 정보)로 수정하면 될 것 같습니다.
                title: Text('조용한 축제'),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: '최신',
                    ),
                    Tab(
                      text: '모임',
                    ),
                    Tab(
                      text: '피드',
                    ),
                  ],
                  isScrollable: true,
                )),
            body: SafeArea(
              child: TabBarView(children: [

          GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    //if (index < 50)
                    return InkWell(
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

                            child: Image.network(images[index]),
                          ),

                        ),
                        margin: EdgeInsets.all(1.0),

                      ),

                    onTap:(){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RatingPage())
                      );
                    });

                  },
                ),
                WebView(
                  initialUrl: 'https://react-naver-map.bluewink.vercel.app/',
                  javascriptMode: JavascriptMode.unrestricted,
                ),
                Feed(),
              ]

              ),
            ),
//           bottomNavigationBar: TabBar(tabs: [
//               Tab(
//                 icon: Icon(Icons.home),
//                 text: 'home',
//               ),
//               Tab(
//                 icon: Icon(Icons.chat),
//                 text: 'chat',
//               ),
// //              Tab(
// //                icon: Icon(Icons.add_a_photo),
// //                text: 'add',
// //              ),
//
//                 Tab(
//                   icon: Icon(Icons.notifications_active),
//                   text: 'noti',
//                 ),
// //                Tab(
// //                  icon: Icon(Icons.people),
// //                  text: 'my',
// //                )
//             ],
//             labelColor: Colors.blue,
//           ),


        )


    );
  }
}
