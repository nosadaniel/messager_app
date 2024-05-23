import 'package:flutter/material.dart';
import 'package:messager_app/features/feed/presentation/animations/rail_animation.dart';
import 'package:messager_app/features/feed/presentation/animations/rail_fab_animation.dart';
import 'package:messager_app/features/feed/presentation/transitions/nav_rail_transition.dart';

import '../../features/feed/presentation/widgets/animated_floating_action_button.dart';
import '../destinations.dart';

class DisappearingNavigationRail extends StatelessWidget {
  const DisappearingNavigationRail(
      {super.key,
      this.onDestinationSelected,
      required this.selectedIndex,
      required this.backgroundColor,
      required this.railAnimation,
      required this.railFabAnimation,
      required this.body});
  final ValueChanged<int>? onDestinationSelected;
  final Color backgroundColor;
  final int selectedIndex;
  final Widget body;
  final RailAnimation railAnimation;
  final RailFabAnimation railFabAnimation;

  @override
  Widget build(BuildContext context) {
    late final colorScheme = Theme.of(context).colorScheme;

    late final navBackgroundColor = Color.alphaBlend(
        colorScheme.primary.withOpacity(0.14), colorScheme.primaryContainer);
    return Scaffold(
      body: Row(children: [
        NavRailTransition(
          animation: railAnimation,
          backgroundColor: backgroundColor,
          child: NavigationRail(
            destinations: destinations
                .map(
                  (d) => NavigationRailDestination(
                    icon: Icon(d.icon),
                    label: Text(d.label),
                  ),
                )
                .toList(),
            selectedIndex: selectedIndex,
            backgroundColor: backgroundColor,
            onDestinationSelected: onDestinationSelected,
            groupAlignment: -0.85,
            leading: Column(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                const SizedBox(height: 8),
                AnimatedFloatingActionButton(
                  animation: railFabAnimation,
                  onPressed: () {},
                  elevation: 0,
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ),
        ),
        Expanded(child: Container(color: backgroundColor, child: body)),
      ]),
    );
  }
}
