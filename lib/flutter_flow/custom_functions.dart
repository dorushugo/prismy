import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime getDateTodayMinuit() {
  // return the datetime from this day at 0 hours
  return DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
}

double? getAverageRating(List<int>? checkupsList) {
  // calcultate average of a list of integer
  if (checkupsList == null || checkupsList.isEmpty) {
    return null;
  }
  int sum = 0;
  for (int rating in checkupsList) {
    sum += rating;
  }
  return sum / checkupsList.length;
}

DateTimeRange dayRangeFromDate(DateTime dateCheckup) {
  // I want a timestamp range from a datetime, the range must go from 00h00:00 to 23h59:59
  DateTime start =
      DateTime(dateCheckup.year, dateCheckup.month, dateCheckup.day, 0, 0, 0);
  DateTime end = DateTime(
      dateCheckup.year, dateCheckup.month, dateCheckup.day, 23, 59, 59);
  return DateTimeRange(start: start, end: end);
}

DateTime getStartofDay(DateTime dateTimeCheckup) {
  // get the start of the day date time (00h00:00) from the date time
  return DateTime(dateTimeCheckup.year, dateTimeCheckup.month,
      dateTimeCheckup.day, 0, 0, 0);
}

DateTime getEndOfDay(DateTime dateTimeCheckup) {
  // get the end of the day (23h59:59) from a datetime
  // get the end of the day date time (23h59:59) from the date time
  return DateTime(dateTimeCheckup.year, dateTimeCheckup.month,
      dateTimeCheckup.day, 23, 59, 59);
}
