import 'package:get/get.dart';
import 'package:push_local_notification/modules/core/services/notification/entities/notification.dart';
import 'package:push_local_notification/modules/core/services/notification/entities/service/notification_service.dart';

class NotificationController extends GetxController {
  final NotificationService _notification = NotificationService();

  void showNotification(CustomNotification notification) {
    _notification.showNotificationNow(
      notification,
    );
  }

  void checkShowNotification() {
    _notification.checkShowNotification();
  }

  void scheduledNotification(
      {required CustomNotification notification, required DateTime dateTime}) {
    _notification.scheduledNotification(notification, dateTime);
  }

  void showNotificationNow(CustomNotification notification) {
    _notification.showNotificationNow(
      notification,
    );
  }
}
