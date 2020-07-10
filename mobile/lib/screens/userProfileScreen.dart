import 'package:datapac/screens/editProfileScreen.dart';
import 'package:datapac/widgets/userDataPacs.dart';
import 'package:datapac/widgets/userSummary.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  void navToEditProfileScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return EditProfileScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UserSummary(),
        InkWell(
          borderRadius: BorderRadius.circular(16),
          splashColor: Theme.of(context).primaryColorDark,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Edit Profile',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onTap: () => navToEditProfileScreen(context),
        ),
        SizedBox(
          height: 32,
        ),
        UserDataPacs(),
      ],
    );
  }
}
