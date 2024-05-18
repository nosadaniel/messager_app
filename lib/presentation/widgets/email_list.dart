import 'package:flutter/material.dart';
import 'package:messager_app/data/data.dart' as data;
import 'package:messager_app/presentation/widgets/email_widget.dart';

import '../../models/user.dart';

class EmailList extends StatelessWidget {
  const EmailList(
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
        //todo: pass Searchbar widget here
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
