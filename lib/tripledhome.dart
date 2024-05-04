import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tripled/alluserspage.dart';
import 'package:tripled/bloc/mainbloc.dart';
import 'package:tripled/common/displayname.dart';
import 'package:tripled/common/profileinfo.dart';
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
          //task 4
          RoundedContainer(
            title: "#4 User Information - Server",
            children: [
              BlocBuilder<MainBloc, MainState>(
                  buildWhen: (previous, current) =>
                      current is LoadingUserInformation ||
                      current is ProfileFetched ||
                      current is PorfileNotFetched ||
                      current is SomethingWrong,
                  builder: (context, state) {
                    if (state is LoadingUserInformation) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CupertinoActivityIndicator(color: Colors.blue),
                          Helper.allowWidth(15),
                          const Text(
                            "Loading...",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      );
                    }
                    if (state is ProfileFetched) {
                      return ProfileInfo(
                        firstName: state.profileModel!.data!.firstName!,
                        lastName: state.profileModel!.data!.lastName!,
                        image: state.profileModel!.data!.avatar,
                        email: state.profileModel!.data!.email,
                      );
                    }
                    if (state is PorfileNotFetched) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.touch_app_outlined,
                            color: Colors.blue,
                          ),
                          Helper.allowWidth(15),
                          const Text(
                            "Click here to load user information",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      );
                    }

                    if (state is SomethingWrong) {
                      return InkWell(
                        onTap: () => context
                            .read<MainBloc>()
                            .add(GetRandomProfile(userId: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error,
                              color: Colors.blue,
                            ),
                            Helper.allowWidth(15),
                            const Text(
                              "Something went wrong",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      );
                    }

                    return InkWell(
                      onTap: () => context
                          .read<MainBloc>()
                          .add(GetRandomProfile(userId: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.touch_app_outlined,
                            color: Colors.blue,
                          ),
                          Helper.allowWidth(15),
                          const Text(
                            "Click here to load user information",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
          //-------------------------------------------------------
          //task 5
          RoundedContainer(
            title: "#5 All Users Information - Server",
            children: [
              InkWell(
                onTap: () => Helper.push(const AllUsersPage()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.touch_app_outlined,
                      color: Colors.blue,
                    ),
                    Helper.allowWidth(15),
                    const Text(
                      "Click here to load all users information",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              )
            ],
          ),
        
        ],
      ),
    );
  }
}
