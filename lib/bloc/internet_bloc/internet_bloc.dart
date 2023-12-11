import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:learn_bloc/bloc/internet_bloc/internet_event.dart';
import 'package:learn_bloc/bloc/internet_bloc/internet_state.dart';
import 'package:bloc/bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? connectivityStreamSubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) {
      print("lost internet");
      emit(InternetLostState());
    });
    on<InternetGainedEvent>((event, emit) {
      emit(InternetGainedState());
    });

    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
