import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messager_app/features/feed/presentation/animations/bar_animation.dart';
import 'package:messager_app/features/feed/presentation/animations/rail_animation.dart';
import 'package:messager_app/features/feed/presentation/animations/rail_fab_animation.dart';
import 'package:messager_app/routing/presentation/disappearing_bottom_navigation_bar.dart';
import 'package:messager_app/routing/presentation/disappearing_navigation_rail.dart';

class ScaffoldWithNestedNavigation extends StatefulWidget {
  const ScaffoldWithNestedNavigation({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey("ScaffoldWithNestedNavigation"));

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends State<ScaffoldWithNestedNavigation>
    with SingleTickerProviderStateMixin {
  late final colorScheme = Theme.of(context).colorScheme;
  late final backgroundColor = Color.alphaBlend(
      colorScheme.primary.withOpacity(0.14), colorScheme.surface);

  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
    reverseDuration: const Duration(milliseconds: 1250),
    value: 0,
  );
  late final _railAnimation = RailAnimation(parent: _controller);
  late final _railFabAnimation = RailFabAnimation(parent: _controller);
  late final _barAnimation = BarAnimation(parent: _controller);

  bool controllerInitialized = false;
//navigate selection
  void _goBranch(int index) {
    widget.navigationShell.goBranch(index,
        //navigation to the initial location when tapping on item
        //that is already active.
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  bool widthSize = false;

  //update animationStatus, widthSize, controller
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double wideScreen = MediaQuery.sizeOf(context).width;
    final AnimationStatus status = _controller.status;

    if (wideScreen > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        _controller.forward();
        widthSize = true;
      }
    } else {
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        _controller.reverse();
        widthSize = false;
      }
    }
    if (!controllerInitialized) {
      controllerInitialized = true;
      _controller.value = wideScreen > 600 ? 1 : 0;
    }
  }

  //dispose controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widthSize
        //animate the navigation
        ? AnimatedBuilder(
            animation: _controller,
            builder: (context, _) => DisappearingNavigationRail(
              onDestinationSelected: _goBranch,
              selectedIndex: widget.navigationShell.currentIndex,
              backgroundColor: backgroundColor,
              body: widget.navigationShell,
              railAnimation: _railAnimation,
              railFabAnimation: _railFabAnimation,
            ),
          )
        : AnimatedBuilder(
            animation: _controller,
            builder: (context, _) => DisappearingBottomNavigationBar(
              onDestinationSelected: _goBranch,
              selectedIndex: widget.navigationShell.currentIndex,
              body: widget.navigationShell,
              barAnimation: _barAnimation,
            ),
          );
  }
}
