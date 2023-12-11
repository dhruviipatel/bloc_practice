import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:learn_bloc/bloc/auth_bloc/auth_login_screen.dart';

class AuthHomeScreen extends StatelessWidget {
  const AuthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AuthLoginScreen()),
                (route) => false,
              );
            });
          }

          if (state is AuthSuuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text((state).uid),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogoutRequestEvent());
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    color: Colors.red,
                    child: Center(child: Text('Logout')),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
