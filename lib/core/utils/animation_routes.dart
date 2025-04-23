import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_visitor/constants.dart';

class AnimationRoutes {
  static Route route(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  static Route routeBottom(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  static Route routeBottomLeft(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  static Widget loadingButton(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: LoadingAnimationWidget.horizontalRotatingDots(
          color: orangeColor,
          size: 50,
        ),
      ),
    );
  }

  static Widget loadingButtonSmall(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.27,
      child: Center(
        child: LoadingAnimationWidget.horizontalRotatingDots(
          color: Color(0xff5235C3),
          size: 50,
        ),
      ),
    );
  }

  static Widget loadingSwitch(BuildContext context) {
    return Container(
      height: 30,
      child: Center(
        child: LoadingAnimationWidget.horizontalRotatingDots(
          color: Color(0xff5235C3),
          size: 50,
        ),
      ),
    );
  }

  static Widget loadingWidget() {
    return Center(
      child: LoadingAnimationWidget.flickr(
        size: 75,
        leftDotColor: Colors.black,
        rightDotColor: orangeColor,
      ),
    );
  }
}
