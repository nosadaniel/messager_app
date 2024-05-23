import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:messager_app/features/feed/presentation/animations/bar_animation.dart';
import 'package:messager_app/features/feed/presentation/animations/rail_animation.dart';
import 'package:messager_app/features/feed/presentation/animations/rail_fab_animation.dart';
import 'package:messager_app/hooks/controller_hooks.dart';
import 'package:messager_app/routing/presentation/disappearing_bottom_navigation_bar.dart';
import 'package:messager_app/routing/presentation/disappearing_navigation_rail.dart';

class ScaffoldWithNestedNavigation extends HookWidget {
  const ScaffoldWithNestedNavigation({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey("ScaffoldWithNestedNavigation"));

  final StatefulNavigationShell navigationShell;

//navigate selection
  void _goBranch(int index) {
    navigationShell.goBranch(index,
        //navigation to the initial location when tapping on item
        //that is already active.
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.sizeOf(context).width;

    final controller = useCustomAnimationController(screenSize);
    late final colorScheme = Theme.of(context).colorScheme;

    late final backgroundColor = Color.alphaBlend(
        colorScheme.primary.withOpacity(0.14), colorScheme.surface);

    // late final _controller = AnimationController(
    final railAnimation = RailAnimation(parent: controller);

    final railFabAnimation = RailFabAnimation(parent: controller);

    final barAnimation = BarAnimation(parent: controller);

    return screenSize > 600
        //animate the navigation
        ? AnimatedBuilder(
            animation: controller,
            builder: (context, _) => DisappearingNavigationRail(
              onDestinationSelected: _goBranch,
              selectedIndex: navigationShell.currentIndex,
              backgroundColor: backgroundColor,
              body: navigationShell,
              railAnimation: railAnimation,
              railFabAnimation: railFabAnimation,
            ),
          )
        : AnimatedBuilder(
            animation: controller,
            builder: (context, _) => DisappearingBottomNavigationBar(
              onDestinationSelected: _goBranch,
              selectedIndex: navigationShell.currentIndex,
              body: navigationShell,
              barAnimation: barAnimation,
            ),
          );
  }
}

// late final _controller = AnimationController(
//   vsync: this,
//   duration: const Duration(milliseconds: 1000),
//   reverseDuration: const Duration(milliseconds: 1250),
//   value: 0,
// );

// bool widthSize = false;
//
// //update animationStatus, widthSize, controller
// @override
// void didChangeDependencies() {
//   super.didChangeDependencies();
//   final double wideScreen = MediaQuery.sizeOf(context).width;
//   final AnimationStatus status = _controller.status;
//
//   if (wideScreen > 600) {
//     if (status != AnimationStatus.forward &&
//         status != AnimationStatus.completed) {
//       _controller.forward();
//       widthSize = true;
//     }
//   } else {
//     if (status != AnimationStatus.reverse &&
//         status != AnimationStatus.dismissed) {
//       _controller.reverse();
//       widthSize = false;
//     }
//   }
//   if (!controllerInitialized) {
//     controllerInitialized = true;
//     _controller.value = wideScreen > 600 ? 1 : 0;
//   }
// }
//
// //dispose controller
// @override
// void dispose() {
//   _controller.dispose();
//   super.dispose();
// }
