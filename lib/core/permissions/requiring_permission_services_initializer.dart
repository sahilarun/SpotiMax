import 'package:flutter_background/flutter_background.dart';
import 'package:spotimax/core/background/background.dart';
import 'package:spotimax/core/notifications/notifications.dart';
import 'package:spotimax/core/permissions/permissions_manager.dart';
import 'package:spotimax/features/presentation/tracks_collections_loading_notifications/view/tracks_collections_loading_notifications_sender.dart';

class RequiringPermissionServicesInitializer {
  RequiringPermissionServicesInitializer({required this.permissionsManager});

  final PermissionsManager permissionsManager;

  bool _isNotificationsInitialized = false;
  bool _isBackgroundInitialized = false;

  Future<void> initialize() async {
    if (!_isNotificationsInitialized && await permissionsManager.isNotificationsPermissionGranted()) {
      _isNotificationsInitialized = true;

      await initAwesomeNotifications();
      await TracksCollectionsLoadingNotificationsSender().startSendNotifications();
    }

    if (!_isBackgroundInitialized && await FlutterBackground.hasPermissions) {
      _isBackgroundInitialized = true;

      await initBackground();
      await FlutterBackground.enableBackgroundExecution();
    }
  }
}
