import 'package:flutter/material.dart';

import '../../../common/widgets/Loader.dart';
import '../../../common/widgets/pageappbar.dart';
import '../../../models/Notification.dart';
import '../../Profile/services/profileservices.dart';
import '../widgets/NotificationTiles.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/notification';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<Notifications>? notifications;
  final ProfileServices profileServices = ProfileServices();

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  void fetchNotifications() async {
    notifications = await profileServices.fetchMyNotifications(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const DefaultAppBar(
        title: 'Notifications',

      ),
      body:   notifications == null
          ? const Loader()
          : ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: notifications!.length,
          itemBuilder: (context, index) {
            return NotificationTiles(
              title: notifications![index].topic,
              subtitle: notifications![index].message,
              enable: true,
              onTap: () {},
              icon: Icon(Icons.notifications),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}
