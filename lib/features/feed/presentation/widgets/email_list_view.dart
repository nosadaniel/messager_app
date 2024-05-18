import 'package:flutter/material.dart';
import 'package:messager_app/features/feed/data/data.dart' as data;
import 'package:messager_app/features/feed/presentation/widgets/search_bar.dart'
    as search_bar;

import '../../models/user.dart';
import 'email_widget.dart';

class EmailListView extends StatelessWidget {
  const EmailListView(
      {super.key,
      this.selectedIndex,
      this.onSelected,
      required this.currentUser});

  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final User currentUser;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 8),
        search_bar.SearchBar(currentUser: currentUser),
        const SizedBox(height: 8),
        ...List.generate(
          data.emails.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: EmailWidget(
              email: data.emails[index],
              onSelected: onSelected != null
                  ? () {
                      onSelected!(index);
                    }
                  : null,
              isSelected: selectedIndex == index,
            ),
          ),
        )
      ],
    );
  }
}
