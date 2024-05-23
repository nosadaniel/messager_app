import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:messager_app/features/feed/presentation/transitions/list_detail_transition.dart';
import 'package:messager_app/hooks/controller_hooks.dart';

import '../models/user.dart';
import 'animations/rail_fab_animation.dart';

class Feed extends HookWidget {
  const Feed({super.key, required this.currentUser});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    final animation = useCustomAnimationController(width);

    final railFabAnimation = RailFabAnimation(parent: animation);

    return ListDetailTransition(
      currentUser: currentUser,
      animation: railFabAnimation,
    );
  }
}
