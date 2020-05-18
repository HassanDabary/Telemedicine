import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pages extends StatelessWidget {
  const Pages({
    Key key,
    @required PageController controller,
    @required this.appbarheight,
    @required this.dwidth,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;
  final double appbarheight;
  final double dwidth;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: PageView(
        physics: ClampingScrollPhysics(),
        controller: _controller,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: appbarheight),
            child: SvgPicture.asset(
              'assets/images/doctor.svg',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              right: 8,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                'assets/images/videoCall.svg',
                width: dwidth,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                'assets/images/pres.svg',
                width: dwidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
