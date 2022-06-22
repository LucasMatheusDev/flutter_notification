import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_local_notification/modules/core/services/notification/entities/notification.dart';
import 'package:push_local_notification/modules/home/domain/controller/notification_controller.dart';

class SelectedTimeNotificationView extends StatefulWidget {
  const SelectedTimeNotificationView({Key? key}) : super(key: key);

  @override
  State<SelectedTimeNotificationView> createState() =>
      _SelectedTimeNotificationViewState();
}

class _SelectedTimeNotificationViewState
    extends State<SelectedTimeNotificationView> {
  final notification =
      Get.put<NotificationController>(NotificationController());

  @override
  void initState() {
    super.initState();
    notification.checkShowNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecionar o tempo da Notificação'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  notification.scheduledNotification(
                    notification: CustomNotification(
                      title: "Consulta Em 5 segundos",
                      body: "Você tem uma consulta em 5 segundos",
                      payload: "received_notification",
                      id: 1,
                    ),
                    dateTime: DateTime.now().add(const Duration(seconds: 5)),
                  );
                  Get.snackbar(
                    "Notificação",
                    "Notificação agendada com sucesso",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    borderRadius: 10,
                    margin: const EdgeInsets.all(10),
                  );
                },
                child: const Text('Notificação em 5 segundos'),
              ),
              ElevatedButton(
                onPressed: () {
                  notification.scheduledNotification(
                    notification: CustomNotification(
                      title: "Consulta Em 30 segundos",
                      body: "Você tem uma consulta em 30 segundos",
                      payload: "received_notification",
                      id: 2,
                    ),
                    dateTime: DateTime.now().add(const Duration(seconds: 30)),
                  );
                  Get.snackbar(
                    "Notificação",
                    "Notificação agendada com sucesso",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    borderRadius: 10,
                    margin: const EdgeInsets.all(10),
                  );
                },
                child: const Text('Notificação em 30 segundos'),
              ),
              ElevatedButton(
                onPressed: () => notification.showNotificationNow(
                  CustomNotification(
                    title: "Consulta Agora",
                    body: "Está Na hora da Consulta",
                    payload: "received_notification",
                    id: 3,
                  ),
                ),
                child: const Text('Notificação Instantânea'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
