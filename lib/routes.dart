import 'package:card_demo/addcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'homepage.dart';
import 'dashboard.dart';
import 'main.dart';

Route toDashRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => dashboardState(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route toHomeRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route toAddYCard() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => addYCardActivity(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
