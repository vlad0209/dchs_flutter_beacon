import 'package:dchs_flutter_beacon/dchs_flutter_beacon.dart';
import 'package:get/get.dart';

class RequirementStateController extends GetxController {
  var bluetoothState = BluetoothState.stateOff.obs;
  var authorizationStatus = AuthorizationStatus.notDetermined.obs;
  var locationService = false.obs;

  final _startBroadcasting = false.obs;
  final _startScanning = false.obs;
  final _pauseScanning = false.obs;

  bool get bluetoothEnabled => bluetoothState.value == BluetoothState.stateOn;
  bool get authorizationStatusOk =>
      authorizationStatus.value == AuthorizationStatus.allowed ||
      authorizationStatus.value == AuthorizationStatus.always;
  bool get locationServiceEnabled => locationService.value;

  void updateBluetoothState(BluetoothState state) {
    bluetoothState.value = state;
  }

  void updateAuthorizationStatus(AuthorizationStatus status) {
    authorizationStatus.value = status;
  }

  void updateLocationService(bool flag) {
    locationService.value = flag;
  }

  void startBroadcasting() {
    _startBroadcasting.value = true;
  }

  void stopBroadcasting() {
    _startBroadcasting.value = false;
  }

  void startScanning() {
    _startScanning.value = true;
    _pauseScanning.value = false;
  }

  void pauseScanning() {
    _startScanning.value = false;
    _pauseScanning.value = true;
  }

  Stream<bool> get startBroadcastStream {
    return _startBroadcasting.stream;
  }

  Stream<bool> get startStream {
    return _startScanning.stream;
  }

  Stream<bool> get pauseStream {
    return _pauseScanning.stream;
  }
}
