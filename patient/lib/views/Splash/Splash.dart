import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:patient/CustomAnimation/revealTransition/reveal_route.dart';
import 'package:patient/views/Intro/intro.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 7), () {
      // visable only in --profile mode
      Navigator.push(
          context,
          RevealRoute(
              page: Intro(),
              maxRadius: 800,
              minRadius: 100,
              centerAlignment: Alignment.center));
    });
    return Scaffold(
        body: Align(
            alignment: Alignment.center,
            child: Container(
              child: FlareActor(
                "assets/flare/LogoAnimation.flr",
                animation: 'start',
              ),
            )
            // child: SvgPicture.asset('assets/images/Logo.svg'),
            ));
  }
}
