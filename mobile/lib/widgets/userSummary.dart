import 'package:datapac/providers/users.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final usersProvider = Provider.of<UsersProvider>(context);
    // final currentUser = usersProvider.currentUser;
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            child: Text(
              'CG',
              style: TextStyle(fontSize: 26),
            ),
          ),
          Text('Cameron Gamble'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('0 pacs'),
              SizedBox(
                width: 16,
              ),
              Text('0 sold'),
            ],
          ),
          Text('11/30/95 first pac')
        ],
      ),
    );
  }
}
