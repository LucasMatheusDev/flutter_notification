import 'package:flutter/material.dart';

class ReceivedNotificationView extends StatefulWidget {
  const ReceivedNotificationView({Key? key}) : super(key: key);

  @override
  State<ReceivedNotificationView> createState() =>
      _ReceivedNotificationViewState();
}

class _ReceivedNotificationViewState extends State<ReceivedNotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Received Notification'),
      ),
      body: Column(
        children: const [Text("Notificação recebidaP")],
      ),
    );
  }
}
