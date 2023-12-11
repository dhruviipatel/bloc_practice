import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:learn_bloc/cubit/auth_cubit/auth_cubit_login.dart';

class AuthCubitHome extends StatelessWidget {
  const AuthCubitHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(context.read<AuthCubit>().state.email),
            Text(context.read<AuthCubit>().state.password),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => AuthCubitLogin()),
                      (route) => false);
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
