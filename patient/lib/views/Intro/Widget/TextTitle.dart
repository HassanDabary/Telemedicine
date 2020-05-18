import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  TextTitle({
    this.text,
    this.subtext,
    Key key,
  }) : super(key: key);

  final String text;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 4,
          horizontal: MediaQuery.of(context).size.width / 15),
      child: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(subtext,
                  style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                      fontSize: 17,
                      fontWeight: FontWeight.w400))
            ],
          )),
    );
  }
}
