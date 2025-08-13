import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetProvider extends ChangeNotifier {
  bool _isOnline = false;
  bool get isOnline => _isOnline;

  late final StreamSubscription<InternetStatus> _subscription;

  InternetProvider() {
    _init();
  }

  Future<void> _init() async {
    _isOnline = await InternetConnection().hasInternetAccess;
    notifyListeners();

    _subscription = InternetConnection().onStatusChange.listen((status) {
      final newStatus = status == InternetStatus.connected;
      if (newStatus != _isOnline) {
        _isOnline = newStatus;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
