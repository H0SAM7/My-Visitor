import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_visitor/constants.dart';

class LoadingWidgets {
  static Widget loadingCircles() {
    return Center(
      child: LoadingAnimationWidget.newtonCradle(
        size: 100,
        color: orangeColor,
      ),
    );
  }

  static Widget loadingthreeRotatingDots() {
    return Center(
      child: LoadingAnimationWidget.threeRotatingDots(
        size: 100,
        color: orangeColor,
      ),
    );
  }
static Widget loadingprogressiveDots() {
    return Center(
      child: LoadingAnimationWidget.progressiveDots(
        size: 100,
        color: orangeColor,
      ),
    );
  }

static Widget loadingdotsTriangle() {
    return Center(
      child: LoadingAnimationWidget.dotsTriangle(
        size: 100,
        color: orangeColor,
      ),
    );
  }
}
