import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient/views/Splash/Splash.dart';
import 'Widget/TextTitle.dart';
import 'Widget/Pages.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin {
  PageController _controller;
  int _currentTitle = 3;
  Widget get currentTitle {
    switch (_currentTitle) {
      case 0:
        return TextTitle(
            key: Key('0'),
            text: "مكالمات صوتية وفيديو",
            subtext: 'تحدث معا طبيبك بالصوت و الصورة ليسهل التشخيص');

      case 1:
        return TextTitle(
          key: Key('1'),
          text: "إحصل على تشخصيك الطبي",
          subtext: 'تنتهي المقابلة بتشخيص طبي يصفة لك الطبيب',
        );

      case 3:
        return TextTitle(
          key: Key('2'),
          text: "إختر الطبيب الذي تريده",
          subtext: "الأن يمكنك إختيار الطبيب الذي تريده بسهوله",
        );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    var dwidth = MediaQuery.of(context).size.width;
    var dheight = MediaQuery.of(context).size.height;
    var appbarheight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color(0xffDCEDFF),
      body: Stack(
        children: <Widget>[
          Pages(
              controller: _controller,
              appbarheight: appbarheight,
              dwidth: dwidth),
          SvgPicture.asset(
            'assets/images/IntroPath.svg',
            width: double.infinity,
            alignment: Alignment.bottomCenter,
          ),
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: currentTitle,
          ),
          Positioned.fill(
              child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: dheight / 10, horizontal: dwidth / 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: InkWell(
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear);
                    if (_controller.page.floor() == 2)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Splash()));
                    setState(() {
                      _currentTitle = _controller.page.floor();
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Text(
                      'التالي',
                      style: TextStyle(
                          color: Color(0xff7787FF),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ))
        ],
      ),
    );
  }
}
