import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tripled/main.dart';

class Helper {
  static GlobalKey key = NavigationService.navigatorKey;
  static final context = key.currentContext;
  static final height = MediaQuery.of(context!).size.height;
  static final width = MediaQuery.of(context!).size.width;
  static allowHeight(double? height) => SizedBox(height: height ?? 10);
  static allowWidth(double? width) => SizedBox(width: width ?? 10);
  static showLog(String? message) => log(message!);
  static shrink() => const SizedBox.shrink();
  static void showToast(String? msg) => Fluttertoast.showToast(msg: msg!);
}
