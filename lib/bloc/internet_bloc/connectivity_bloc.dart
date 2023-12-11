import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { connected, disconnected, initial }

enum ConnectivityEvent { checkConnectivity }

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityStatus> {
  final Connectivity _connectivity = Connectivity();

  ConnectivityBloc() : super(ConnectivityStatus.initial) {
    on<ConnectivityEvent>(_onConnectivityEvent);
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      add(ConnectivityEvent.checkConnectivity);
    });
  }

  void _onConnectivityEvent(
      ConnectivityEvent event, Emitter<ConnectivityStatus> emit) async {
    if (event == ConnectivityEvent.checkConnectivity) {
      final ConnectivityResult result = await _connectivity.checkConnectivity();

      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        emit(ConnectivityStatus.connected);
      } else {
        emit(ConnectivityStatus.disconnected);
      }
    }
  }
}
