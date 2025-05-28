import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';

class InternetController extends GetxController {
  late final StreamSubscription<List<ConnectivityResult>> _subscription;
  @override
  void onInit() {
    super.onInit();

    _subscription = Connectivity().onConnectivityChanged.listen(
      _updateInternetStatus,
    );
  }

  void _updateInternetStatus(List<ConnectivityResult> status) {
    if (status.contains(ConnectivityResult.none) &&
        Get.isBottomSheetOpen != true) {
      Get.bottomSheet(
        const CustomBottomSheet(
          title: "You're Offline",
          subtitle: "No internet connection, reconnect\nand try again",
          noNet: true,
        ),
        isDismissible: false,
        enableDrag: false,
      );
    } else if (!status.contains(ConnectivityResult.none) &&
        Get.isBottomSheetOpen == true) {
      Get.back();
    }
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
