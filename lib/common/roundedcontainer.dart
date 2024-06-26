import 'package:flutter/material.dart';
import 'package:tripled/utils/helper.dart';

class RoundedContainer extends StatelessWidget {
  final List<Widget>? children;
  final String? title;
  const RoundedContainer(
      {super.key, required this.children, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title!,
            style: const TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        const Divider(color: Colors.blueGrey),
        Helper.allowHeight(15),
        Container(
          width: Helper.width,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children!,
          ),
        ),
        Helper.allowHeight(15),
      ],
    );
  }
}
