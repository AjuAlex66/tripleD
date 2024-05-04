import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripled/common/roundedcontainer.dart';
import 'package:tripled/utils/changerclass.dart';
import 'package:tripled/utils/initializer.dart';

class TripleDHome extends StatelessWidget {
  const TripleDHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TripleD"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        shrinkWrap: true,
        children: [
           // task 1
          Consumer<Changer>(
            builder: (context, value, child) => RoundedContainer(
              title: "#1 Drop down - no plugin",
              children: [
                const Text("More Actions"),
                DropdownButton<String>(
                  isExpanded: true,
                  value: Initializer.tripleDropValue,
                  items: Initializer.tripleDropList
                      .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                                color:
                                    e == "Delete" ? Colors.red : Colors.black),
                          )))
                      .toList(),
                  onChanged: (value) {
                    Initializer.tripleDropValue = value;
                    context.read<Changer>().justChange();
                  },
                ),
              ],
            ),
          ),
          //-------------------------------------------------------
        ],
      ),
    );
  }
}
