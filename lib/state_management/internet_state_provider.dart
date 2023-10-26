import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectivityStatus { NotDetermined, isConnected, isDisonnected }

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {

  ConnectivityStatus? lastResult;
  ConnectivityStatus? newState;

  ConnectivityStatusNotifier() : super(ConnectivityStatus.isConnected) {
    if (state == ConnectivityStatus.isConnected) {
      lastResult = ConnectivityStatus.isConnected;
    } else {
      lastResult = ConnectivityStatus.isDisonnected;
    }
    lastResult = ConnectivityStatus.NotDetermined;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          newState = ConnectivityStatus.isConnected;
          break;
        case ConnectivityResult.none:
          newState = ConnectivityStatus.isDisonnected;
          break;
          case ConnectivityResult.bluetooth:
          // TODO: Handle this case.
        case ConnectivityResult.ethernet:
          // TODO: Handle this case.
        case ConnectivityResult.vpn:
          // TODO: Handle this case.
        case ConnectivityResult.other:
          // TODO: Handle this case.
      }
      if (newState != lastResult) {
        state = newState!;
        lastResult = newState;
      }
    });
  }
}
// Final Global Variable which will expose the state.
// Should be outside of the class.

final connectivityStatusProviders = StateNotifierProvider((ref) {
  return ConnectivityStatusNotifier();
});