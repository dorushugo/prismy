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
