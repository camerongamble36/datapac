import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  final lastnameFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();

  void saveNewUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Profile'),
      ),
      body: Form(
        key: this._form,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 40,
                  child: Text(
                    'CG',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Firstname',
                ),
                onSaved: (newFirstName) {},
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(this.lastnameFocusNode);
                },
              ),
              TextFormField(
                focusNode: this.lastnameFocusNode,
                decoration: InputDecoration(
                  hintText: 'Lastname',
                ),
                onSaved: (newLastName) {},
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(this.usernameFocusNode);
                },
              ),
              TextFormField(
                focusNode: this.usernameFocusNode,
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
                onSaved: (newUsername) {},
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                child: Text('Save'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () => saveNewUser(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
