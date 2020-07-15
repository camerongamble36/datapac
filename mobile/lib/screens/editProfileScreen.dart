import 'package:datapac/model/user.model.dart';
import 'package:datapac/providers/users.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _form = GlobalKey<FormState>();

  final lastnameFocusNode = FocusNode();

  final usernameFocusNode = FocusNode();

  final imageUrlFocusNode = FocusNode();

  final dobFocusNode = FocusNode();

  var isLoading = false;

  var firstname;

  var lastname;

  var imageUrl;

  var username;

  var dob;

  void saveNewUser() {
    setState(() {
      this.isLoading = true;
    });
    final usersProvider = Provider.of<UsersProvider>(context);
    this._form.currentState.save();
    final updatedUser = User(
      firstname: this.firstname,
      lastname: this.lastname,
      imageUrl: this.imageUrl,
      username: this.username,
      dob: this.dob,
    );
    usersProvider.updateUser(updatedUser).then((res) {
      print(res);
      setState(() {
        this.isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Profile'),
      ),
      body: Form(
        key: this._form,
        child: this.isLoading
            ? CircularProgressIndicator()
            : Container(
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
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Firstname',
                            ),
                            onSaved: (newFirstname) {
                              this.firstname = newFirstname;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(this.lastnameFocusNode);
                            },
                          ),
                          TextFormField(
                            focusNode: this.lastnameFocusNode,
                            decoration: InputDecoration(
                              hintText: 'Lastname',
                            ),
                            onSaved: (newLastName) {
                              this.lastname = newLastName;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(this.usernameFocusNode);
                            },
                          ),
                          TextFormField(
                            focusNode: this.imageUrlFocusNode,
                            decoration: InputDecoration(
                              hintText: 'Image URL',
                            ),
                            onSaved: (newImageUrl) {
                              this.imageUrl = newImageUrl;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(this.dobFocusNode);
                            },
                          ),
                          TextFormField(
                            focusNode: this.usernameFocusNode,
                            decoration: InputDecoration(
                              hintText: 'Username',
                            ),
                            onSaved: (newUsername) {
                              this.username = newUsername;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(this.dobFocusNode);
                            },
                          ),
                          TextFormField(
                            focusNode: this.dobFocusNode,
                            decoration: InputDecoration(
                              hintText: 'Date Of Birth',
                            ),
                            onSaved: (newDob) {
                              this.dob = newDob;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RaisedButton(
                      child: Text('Save'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        saveNewUser();
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
