import 'package:datapac/model/datapac.model.dart';
import 'package:datapac/providers/datapacs.provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewDatapacScreen extends StatefulWidget {
  @override
  _NewDatapacScreenState createState() => _NewDatapacScreenState();
}

class _NewDatapacScreenState extends State<NewDatapacScreen> {
  final _form = GlobalKey<FormState>();
  final titleFocusNode = FocusNode();
  final ownerNameFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  bool isLoading = false;
  String imageUrl;
  String title;
  String description;
  String timestamp;
  String ownerName;
  String privacy = 'Public';
  int dropdownValue = 1;
  bool rankEnabled = false;
  bool accuracyEnabled = false;
  bool userInteractionsEnabled = false;
  bool viewsEnabled = false;
  bool sharesEnabled = false;
  bool typeEnabled = false;
  List<String> metrics = [];

  void submitDatapac() {
    setState(() {
      this.isLoading = true;
    });
    this.finalizeMetrics();
    final datapacService =
        Provider.of<DatapacsProvider>(context, listen: false);
    this._form.currentState.save();
    final timestamp = DateFormat.yMMMd().format(DateTime.now());
    final newDatapac = Datapac(
      title: this.title,
      description: this.description,
      imageUrl: this.imageUrl,
      owner: this.ownerName,
      summary: this.description,
      timestamp: timestamp,
      metrics: this.metrics,
    );
    datapacService.addNewDatapac(newDatapac);
    setState(() {
      this.isLoading = false;
      print(newDatapac);
    });
  }

  // Finalize Metrics List
  void finalizeMetrics() {
    if (this.rankEnabled == true) {
      if (this.metrics.contains('rank')) {
        setState(() {
          print(this.metrics);
          return;
        });
      } else {
        setState(() {
          this.metrics.add('rank');
          print(this.metrics);
        });
      }
    } else if (this.rankEnabled == false) {
      if (this.metrics.contains('rank')) {
        setState(() {
          this.metrics.remove('rank');
          print(this.metrics);
        });
      } else {
        setState(() {
          print(this.metrics);
          return;
        });
      }
    }

    if (this.accuracyEnabled == true) {
      if (this.metrics.contains('accuracy')) {
        setState(() {
          print(this.metrics);
          return;
        });
      } else {
        setState(() {
          this.metrics.add('accuracy');
          print(this.metrics);
        });
      }
    } else if (this.accuracyEnabled == false) {
      if (this.metrics.contains('accuracy')) {
        setState(() {
          this.metrics.remove('accuracy');
          print(this.metrics);
        });
      } else {
        setState(() {
          print(this.metrics);
          return;
        });
      }
    }

    if (this.userInteractionsEnabled == true) {
      if (this.metrics.contains('interactions')) {
        setState(() {
          print(this.metrics);
          return;
        });
      } else {
        setState(() {
          this.metrics.add('interactions');
          print(this.metrics);
        });
      }
    } else if (this.userInteractionsEnabled == false) {
      if (this.metrics.contains('interactions')) {
        setState(() {
          this.metrics.remove('interactions');
          print(this.metrics);
        });
      } else {
        setState(() {
          print(this.metrics);
          return;
        });
      }
    }

    if (this.viewsEnabled == true) {
      if (this.metrics.contains('views')) {
        setState(() {
          print(this.metrics);
          return;
        });
      } else {
        setState(() {
          this.metrics.add('views');
          print(this.metrics);
        });
      }
    } else if (this.viewsEnabled == false) {
      if (this.metrics.contains('views')) {
        setState(() {
          this.metrics.remove('views');
          print(this.metrics);
        });
      } else {
        setState(() {
          print(this.metrics);
          return;
        });
      }
    }

    if (this.sharesEnabled == true) {
      if (this.metrics.contains('shares')) {
        setState(() {
          print(this.metrics);
          return;
        });
      } else {
        setState(() {
          this.metrics.add('shares');
          print(this.metrics);
        });
      }
    } else if (this.sharesEnabled == false) {
      if (this.metrics.contains('shares')) {
        setState(() {
          this.metrics.remove('shares');
          print(this.metrics);
        });
      } else {
        setState(() {
          print(this.metrics);
          return;
        });
      }
    }

    if (this.typeEnabled == true) {
      if (this.metrics.contains('type')) {
        setState(() {
          print(this.metrics);
          return;
        });
      } else {
        setState(() {
          this.metrics.add('type');
          print(this.metrics);
        });
      }
    } else if (this.typeEnabled == false) {
      if (this.metrics.contains('type')) {
        setState(() {
          this.metrics.remove('type');
          print(this.metrics);
        });
      } else {
        setState(() {
          print(this.metrics);
          return;
        });
      }
    }
  }
  // Finalize Metrics List

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Pac'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Center(
              child: this.imageUrl == null || this.imageUrl.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          child: Icon(Icons.add_a_photo),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Datapac pic input',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  : FittedBox(
                      child: Image.network(this.imageUrl),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          this.isLoading
              ? CircularProgressIndicator()
              : Form(
                  key: this._form,
                  child: Container(
                    margin: EdgeInsets.all(32),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Image Url'),
                          keyboardType: TextInputType.url,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(this.titleFocusNode);
                          },
                          onSaved: (imageUrl) {
                            this.imageUrl = imageUrl;
                            print(this.imageUrl);
                          },
                        ),
                        TextFormField(
                          focusNode: this.titleFocusNode,
                          decoration: InputDecoration(hintText: 'Title'),
                          keyboardType: TextInputType.name,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(this.ownerNameFocusNode);
                          },
                          onSaved: (title) {
                            this.title = title;
                            print(this.title);
                          },
                        ),
                        TextFormField(
                          focusNode: this.ownerNameFocusNode,
                          decoration: InputDecoration(hintText: 'Owner Name'),
                          keyboardType: TextInputType.name,
                          onSaved: (ownerName) {
                            this.ownerName = ownerName;
                            print(this.ownerName);
                          },
                        ),
                        TextFormField(
                          focusNode: this.descriptionFocusNode,
                          decoration: InputDecoration(hintText: 'Description'),
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          onSaved: (description) {
                            this.description = description;
                            print(this.description);
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('No imported files*'),
                            RaisedButton(
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: () {
                                print('Import document');
                              },
                              child: Text('Import'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            backgroundColor:
                                this.rankEnabled ? Colors.white : null,
                            radius: this.rankEnabled ? 18 : 24,
                            child: Icon(
                              Icons.format_list_numbered,
                              color: this.rankEnabled
                                  ? Theme.of(context).primaryColor
                                  : null,
                              size: this.rankEnabled ? 18 : 24,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              this.rankEnabled = !this.rankEnabled;
                              print(this.rankEnabled);
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Rank',
                          style: TextStyle(
                            fontWeight:
                                this.rankEnabled ? FontWeight.bold : null,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            backgroundColor:
                                this.accuracyEnabled ? Colors.white : null,
                            radius: this.accuracyEnabled ? 18 : 24,
                            child: Icon(
                              Icons.adjust,
                              color: this.accuracyEnabled
                                  ? Theme.of(context).primaryColor
                                  : null,
                              size: this.accuracyEnabled ? 18 : 24,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              this.accuracyEnabled = !this.accuracyEnabled;
                              print(this.accuracyEnabled);
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Accuracy',
                          style: TextStyle(
                            fontWeight:
                                this.accuracyEnabled ? FontWeight.bold : null,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            backgroundColor: this.userInteractionsEnabled
                                ? Colors.white
                                : null,
                            radius: this.userInteractionsEnabled ? 18 : 24,
                            child: Icon(
                              Icons.people,
                              color: this.userInteractionsEnabled
                                  ? Theme.of(context).primaryColor
                                  : null,
                              size: this.userInteractionsEnabled ? 18 : 24,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              this.userInteractionsEnabled =
                                  !this.userInteractionsEnabled;
                              print(this.userInteractionsEnabled);
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        Text(
                          'User int.',
                          style: TextStyle(
                            fontWeight: this.userInteractionsEnabled
                                ? FontWeight.bold
                                : null,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            backgroundColor:
                                this.viewsEnabled ? Colors.white : null,
                            radius: this.viewsEnabled ? 18 : 24,
                            child: Icon(
                              Icons.remove_red_eye,
                              color: this.viewsEnabled
                                  ? Theme.of(context).primaryColor
                                  : null,
                              size: this.viewsEnabled ? 18 : 24,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              this.viewsEnabled = !this.viewsEnabled;
                              print(this.viewsEnabled);
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Views',
                          style: TextStyle(
                            fontWeight:
                                this.viewsEnabled ? FontWeight.bold : null,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            backgroundColor:
                                this.sharesEnabled ? Colors.white : null,
                            radius: this.sharesEnabled ? 18 : 24,
                            child: Icon(
                              Icons.import_export,
                              color: this.sharesEnabled
                                  ? Theme.of(context).primaryColor
                                  : null,
                              size: this.typeEnabled ? 18 : 24,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              this.sharesEnabled = !this.sharesEnabled;
                              print(this.sharesEnabled);
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Shares',
                          style: TextStyle(
                            fontWeight:
                                this.sharesEnabled ? FontWeight.bold : null,
                          ),
                        ),
                      ],
                    ),
                    // Do Type by icon
                    Column(
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            backgroundColor:
                                this.typeEnabled ? Colors.white : null,
                            radius: this.typeEnabled ? 18 : 24,
                            child: Icon(
                              Icons.apps,
                              color: this.typeEnabled
                                  ? Theme.of(context).primaryColor
                                  : null,
                              size: this.typeEnabled ? 18 : 24,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              this.typeEnabled = !this.typeEnabled;
                              print(this.typeEnabled);
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Type',
                          style: TextStyle(
                            fontWeight:
                                this.typeEnabled ? FontWeight.bold : null,
                          ),
                        )
                      ],
                    ),
                    // Do Type by icon
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PopupMenuButton(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      this.privacy,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onSelected: (String result) {
                    setState(() {
                      this.privacy = result;
                    });
                  },
                  itemBuilder: (BuildContext ctx) => <PopupMenuEntry<String>>[
                    const PopupMenuItem(
                      child: Text('Public'),
                      value: 'Public',
                    ),
                    const PopupMenuItem(
                      child: Text('Private'),
                      value: 'Private',
                    ),
                  ],
                ),
                DropdownButton<int>(
                  value: this.dropdownValue,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.blueGrey),
                  underline: Container(
                    height: 2,
                    color: Colors.blueGrey,
                  ),
                  onChanged: (int newValue) {
                    setState(() {
                      this.dropdownValue = newValue;
                      print(this.dropdownValue);
                    });
                  },
                  items: this.privacy == 'Public'
                      ? <int>[1, 10, 30, 50, 75, 100]
                          .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList()
                      : this.privacy == 'Private'
                          ? <int>[1].map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList()
                          : null,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Text('Submit'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    this.submitDatapac();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
