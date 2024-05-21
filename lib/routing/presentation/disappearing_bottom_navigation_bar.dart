import 'package:flutter/material.dart';
import 'package:messager_app/features/feed/presentation/animations/bar_animation.dart';
import 'package:messager_app/features/feed/presentation/transitions/bottom_bar_transition.dart';

import '../../features/feed/presentation/widgets/animated_floating_action_button.dart';
import '../destinations.dart';

class DisappearingBottomNavigationBar extends StatelessWidget {
  const DisappearingBottomNavigationBar(
      {super.key,
      required this.selectedIndex,
      required this.body,
      required this.barAnimation,
      this.onDestinationSelected});

  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final Widget body;
  final BarAnimation barAnimation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      floatingActionButton: AnimatedFloatingActionButton(
        onPressed: () {},
        elevation: 0,
        animation: barAnimation,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomBarTransition(
        animation: barAnimation,
        backgroundColor: Colors.white,
        child: NavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          destinations: destinations.map<NavigationDestination>((destination) {
            return NavigationDestination(
                icon: Icon(destination.icon), label: destination.label);
          }).toList(),
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
        ),
      ),
    );
  }
}
