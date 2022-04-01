import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool checkPaymentCode(String paymentCode) {
  // Check if passed argument is equal to ADAGIO
  if (paymentCode.length == 7 &&
      paymentCode[0] == 'A' &&
      paymentCode[1] == 'D' &&
      paymentCode[2] == 'A' &&
      paymentCode[3] == 'G' &&
      paymentCode[4] == 'I' &&
      paymentCode[5] == 'O' &&
      paymentCode[6] == 'O') {
    return true;
  } else {
    return false;
  }
}
