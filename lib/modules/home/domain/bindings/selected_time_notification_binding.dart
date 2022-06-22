import 'package:get/get.dart';
import 'package:push_local_notification/modules/home/domain/controller/notification_controller.dart';

class SelectedTimeNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificationController>(NotificationController());
  }
}
