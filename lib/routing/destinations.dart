import 'package:flutter/material.dart';

class Destination {
  final IconData icon;
  final String label;

  const Destination(this.icon, this.label);
}

const List<Destination> destinations = <Destination>[
  Destination(Icons.inbox_rounded, 'Inbox'),
  Destination(Icons.article_outlined, 'Articles'),
  Destination(Icons.messenger_outline_outlined, 'Messages'),
  Destination(Icons.group_outlined, 'Groups')
];
