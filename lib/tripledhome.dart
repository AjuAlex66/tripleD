import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripled/common/displayname.dart';
import 'package:tripled/common/roundedcontainer.dart';
import 'package:tripled/utils/changerclass.dart';
import 'package:tripled/utils/helper.dart';
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
          //task 2
          Consumer<Changer>(
            builder: (context, value, child) => RoundedContainer(
              title: "#2 Country and State",
              children: [
                const Text("Country"),
                DropdownButton<String>(
                  isExpanded: true,
                  value: Initializer.tripleCountry,
                  items: Initializer.tripleCountryList
                      .map((e) => DropdownMenuItem<String>(
                          value: e['country'],
                          child: Text(
                            e['country'],
                            style: const TextStyle(),
                          )))
                      .toList(),
                  onChanged: (value) {
                    Initializer.tripleCountry = value;
                    for (var e in Initializer.tripleCountryList) {
                      if (e['country'] == value) {
                        e['selected'] = true;
                        break;
                      } else {
                        e['selected'] = false;
                      }
                    }
                    context.read<Changer>().justChange();
                  },
                ),
                Helper.allowHeight(15),
                const Text("State"),
                DropdownButton<String>(
                  isExpanded: true,
                  value: Initializer.tripleCountryList
                      .where((element) => element['selected'])
                      .first['states'],
                  items: Initializer.tripleCountryList
                      .map((e) => DropdownMenuItem<String>(
                          value: e['states'],
                          child: Text(
                            e['states'],
                            style: const TextStyle(),
                          )))
                      .toList(),
                  onChanged: (value) {
                    for (var e in Initializer.tripleCountryList) {
                      if (e['states'] == value) {
                        Initializer.tripleCountry = e['country'];
                        e['selected'] = true;
                        break;
                      } else {
                        e['selected'] = false;
                      }
                    }
                    context.read<Changer>().justChange();
                  },
                ),
              ],
            ),
          ),
          //-------------------------------------------------------
          //task 3
          const RoundedContainer(title: '#3 Name Widget', children: [
            DisplayName(
                firstName: "Aju",
                secondName: "Alex",
                prefix: "Mr.",
                suffix: "Flutter Developer"),
          ]),
          //-------------------------------------------------------
        ],
      ),
    );
  }
}
