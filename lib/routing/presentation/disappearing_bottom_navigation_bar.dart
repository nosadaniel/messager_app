import 'package:flutter/material.dart';

import '../destinations.dart';

class DisappearingBottomNavigationBar extends StatelessWidget {
  const DisappearingBottomNavigationBar(
      {super.key,
      required this.selectedIndex,
      required this.body,
      this.onDestinationSelected});
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    late final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: body,
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.tertiaryContainer,
        foregroundColor: colorScheme.onTertiaryContainer,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        destinations: destinations.map<NavigationDestination>((destination) {
          return NavigationDestination(
              icon: Icon(destination.icon), label: destination.label);
        }).toList(),
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
