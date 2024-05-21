import 'package:flutter/material.dart';

import '../destinations.dart';

class DisappearingNavigationRail extends StatelessWidget {
  const DisappearingNavigationRail(
      {super.key,
      this.onDestinationSelected,
      required this.selectedIndex,
      required this.backgroundColor,
      required this.body});
  final ValueChanged<int>? onDestinationSelected;
  final Color backgroundColor;
  final int selectedIndex;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Row(children: [
        NavigationRail(
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
              FloatingActionButton(
                onPressed: () {},
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                backgroundColor: colorScheme.tertiaryContainer,
                foregroundColor: colorScheme.onTertiaryContainer,
                child: const Icon(Icons.add),
              )
            ],
          ),
        ),
        Expanded(child: body),
      ]),
    );
  }
}
