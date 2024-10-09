// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<DateTime>> getLastSevenDays() async {
  // return the date of the last 7 days including today
  List<DateTime> last7Days = [];

  for (int i = 0; i < 7; i++) {
    DateTime date = DateTime.now().subtract(Duration(days: i));
    last7Days.add(date);
  }

  return last7Days;
}
