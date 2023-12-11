import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequestEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        if (event.email.isEmpty) {
          return emit(AuthFailure('Enter Email'));
        } else if (event.password.length < 6) {
          return emit(AuthFailure('Enter password at least 6 characters'));
        }
        await Future.delayed(Duration(seconds: 1), () {
          return emit(AuthSuuccess(uid: '${event.email + event.password}'));
        });
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });

    on<AuthLogoutRequestEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(Duration(seconds: 1), () {
          return emit(AuthInitial());
        });
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
  }
}
