
import 'package:flutter/material.dart';
import 'package:tripled/common/displayname.dart';
import 'package:tripled/utils/helper.dart';

class ProfileInfo extends StatelessWidget {
  final String? image, firstName, lastName, email;
   const ProfileInfo(
      {required this.firstName, required this.image, this.lastName, this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(image!),
          radius: 26,
        ),
        Helper.allowWidth(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DisplayName(
              firstName: firstName!,
              secondName: lastName ?? "",
            ),
            // Helper.allowHeight(2.0),
            Text(email?? "N/A")
          ],
        )
      ],
    );
  }
}
