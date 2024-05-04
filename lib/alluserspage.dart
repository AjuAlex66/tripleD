import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripled/bloc/mainbloc.dart';
import 'package:tripled/common/profileinfo.dart';
import 'package:tripled/utils/helper.dart';

class AllUsersPage extends StatefulWidget {
  const AllUsersPage({super.key});

  @override
  State<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  @override
  void initState() {
  context.read<MainBloc>().add(GetAllProfiles());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users Profile"),
        ),
        body: BlocBuilder<MainBloc, MainState>(
            buildWhen: (previous, current) =>
                current is GettingAllProfiles ||
                current is AllProfilesFetched ||
                current is AllProfilesNotFetched ||
                current is SomethingWrong,
            builder: (context, state) {
              if (state is GettingAllProfiles) {
                return Center(
                  child: Row(
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
                  ),
                );
              }
              if (state is AllProfilesFetched) {
                return ListView.separated(
                    padding: const EdgeInsets.all(14.0),
                    itemBuilder: (context, index) => ProfileInfo(
                          firstName:
                              state.profileListModel!.data![index].firstName!,
                          lastName:
                              state.profileListModel!.data![index].lastName!,
                          image: state.profileListModel!.data![index].avatar,
                          email: state.profileListModel!.data![index].email,
                        ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.profileListModel!.data!.length);
              }
              if (state is AllProfilesNotFetched) {
                return Center(
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
              }

              return Center(
                child: InkWell(
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
                ),
              );
            }));
  }
}
