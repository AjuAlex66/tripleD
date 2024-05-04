import 'package:flutter/material.dart';
import 'package:tripled/utils/misc.dart';

class DisplayName extends StatelessWidget {
  final String firstName, secondName, prefix, suffix;
  const DisplayName(
      {required this.firstName,
      this.secondName = "",
      this.prefix = "",
      this.suffix = "",
      super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        checkText(prefix, 0) +
            firstName +
            checkText(secondName, 1) +
            checkText(suffix, 1),
        style: const TextStyle(color: Colors.blue, fontSize: 16),
      ),
    );
  }

  checkText(String text, int i) => !Misc.isEmpty(text)
      ? i == 1
          ? " $text"
          : "$text "
      : text;
}
