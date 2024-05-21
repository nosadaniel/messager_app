import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messager_app/routing/presentation/disappearing_bottom_navigation_bar.dart';
import 'package:messager_app/routing/presentation/disappearing_navigation_rail.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey("ScaffoldWithNestedNavigation"));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(index,
        //navigation to the initial location when tapping on item
        //that is already active.
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    late final colorScheme = Theme.of(context).colorScheme;
    late final backgroundColor = Color.alphaBlend(
        colorScheme.primary.withOpacity(0.14), colorScheme.surface);

    final double wideScreen = MediaQuery.sizeOf(context).width;
    return wideScreen > 600
        ? DisappearingNavigationRail(
            onDestinationSelected: _goBranch,
            selectedIndex: navigationShell.currentIndex,
            backgroundColor: backgroundColor,
            body: navigationShell)
        : DisappearingBottomNavigationBar(
            onDestinationSelected: _goBranch,
            selectedIndex: navigationShell.currentIndex,
            body: navigationShell);
  }
}
