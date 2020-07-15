import 'package:flutter/material.dart';

class Datapac {
  String id;
  String title;
  String imageUrl;
  String description;
  String summary;
  String owner;
  String timestamp;
  List<String> metrics;

  Datapac({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.description,
    @required this.summary,
    @required this.owner,
    @required this.timestamp,
    @required this.metrics,
  });
}
