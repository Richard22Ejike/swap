



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/GlobalVariables.dart';
import '../../../constants/errorHandling.dart';
import '../../../constants/utils.dart';
import '../../../models/Notification.dart';
import '../../../providers/user_providers.dart';
import '../../auth/screens/authScreen.dart';


class ProfileServices {
  void addNotification({
    required BuildContext context,
    required String topic,
    required String message,

  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {


      Notifications notification = Notifications(
        topic: topic,
        message: message,

      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/add-user-notifications'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: notification.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Notification Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  Future<List< Notifications>> fetchMyNotifications({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List< Notifications>  notificationsList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/api/get-user-notification'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            notificationsList.add(
              Notifications.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return notificationsList;
  }


  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routeName,
            (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}