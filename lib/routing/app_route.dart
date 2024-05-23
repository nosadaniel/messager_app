import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messager_app/features/feed/data/data.dart' as data;
import 'package:messager_app/features/feed/presentation/feed.dart';
import 'package:messager_app/features/feed/presentation/widgets/articles_list_view.dart';
import 'package:messager_app/routing/scaffold_with_nested_navigation.dart';

enum AppRoute { inbox, articles, messages, groups }

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _inboxNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'inbox');
final _articlesNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'articles');
final _messagesNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'messages');
final _groupsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'groups');

final goRouterProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/${AppRoute.inbox.name}',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      //nested stateful navigation
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              ScaffoldWithNestedNavigation(navigationShell: navigationShell),
          branches: [
            // stateful navigation
            StatefulShellBranch(navigatorKey: _inboxNavigatorKey, routes: [
              GoRoute(
                path: '/${AppRoute.inbox.name}',
                name: AppRoute.inbox.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: Feed(
                    currentUser: data.user_0,
                    key: state.pageKey,
                  ),
                ),
              ),
            ]),
            StatefulShellBranch(navigatorKey: _articlesNavigatorKey, routes: [
              GoRoute(
                  path: '/${AppRoute.articles.name}',
                  name: AppRoute.articles.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                      child: const ArticlesListView(
                        text: "new articles coming soon",
                      ),
                      key: state.pageKey))
            ]),
            StatefulShellBranch(navigatorKey: _messagesNavigatorKey, routes: [
              GoRoute(
                  path: '/${AppRoute.messages.name}',
                  name: AppRoute.messages.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                      child: const ArticlesListView(
                        text: "new messages coming soon",
                      ),
                      key: state.pageKey))
            ]),
            StatefulShellBranch(navigatorKey: _groupsNavigatorKey, routes: [
              GoRoute(
                  path: '/${AppRoute.groups.name}',
                  name: AppRoute.groups.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                      child: const ArticlesListView(
                        text: "new groups coming soon",
                      ),
                      key: state.pageKey))
            ]),
          ]),
    ],
  ),
);
