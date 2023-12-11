import 'package:bloc/bloc.dart';
import 'package:learn_bloc/cubit/auth_cubit/auth_model.dart';

class AuthCubit extends Cubit<AuthModel> {
  AuthCubit() : super(AuthModel(email: '', password: ''));

  void login(String email, String pass) {
    final AuthModel auth = AuthModel(email: email, password: pass);

    emit(auth);
  }
}
