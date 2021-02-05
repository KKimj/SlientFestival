
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slientfestival/src/model/review_model.dart';
import 'package:slientfestival/src/pages/home_page.dart';
import 'package:slientfestival/src/theme/extention.dart';
import 'package:slientfestival/src/theme/light_color.dart';
import 'package:slientfestival/src/theme/text_styles.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReviewModel>(create: (_) => ReviewModel()),
      ],
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("test/test_logo.jpeg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: .6,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [LightColor.purpleExtraLight, LightColor.purple],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.mirror,
                        stops: [.5, 6]),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Image.asset("test/test_logo2.jpg", color: Colors.white,height: 100,),
                Text(
                  "조용한 파티",
                  style: TextStyles.h1Style.white,
                ),
                Text(
                  "모두를 위한 커뮤니티!",
                  style: TextStyles.bodySm.white.bold,
                ),
                Expanded(
                  flex: 7,
                  child: SizedBox(),
                ),
              ],
            ).alignTopCenter,
          ],
        ),
      ),
    );
  }
}
