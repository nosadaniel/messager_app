import 'package:flutter/animation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AnimationController useCustomAnimationController(double screenSize) {
  final animationController = useAnimationController(
    duration: const Duration(milliseconds: 1000),
    reverseDuration: const Duration(milliseconds: 1250),
    initialValue: 0,
  );

  useEffect(() {
    final AnimationStatus status = animationController.status;

    if (screenSize > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        animationController.forward();
      }
    } else {
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        animationController.reverse();
      }
    }
  });
  //tell flutter to rebuild widget on value change
  useAnimation(animationController);
  return animationController;
}
