import 'package:flutter/material.dart';

class BouncyPageRoute extends PageRouteBuilder {
  final Widget widget;
  BouncyPageRoute({required this.widget})
      : super(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder:
                (BuildContext context, animation, animationTime, Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInOutBack);
              return ScaleTransition(
                alignment: Alignment.topLeft,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (
              BuildContext context,
              animation,
              animationTime,
            ) {
              return widget;
            });
}
