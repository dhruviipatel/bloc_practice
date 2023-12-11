import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:learn_bloc/bloc/auth_bloc/auth_home_screen.dart';

class AuthLoginScreen extends StatelessWidget {
  const AuthLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return SafeArea(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
          if (state is AuthSuuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AuthHomeScreen()),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Auth Login",
                    style: TextStyle(fontSize: 30),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "Enter Email"),
                  ),
                  TextFormField(
                    controller: passController,
                    decoration: InputDecoration(hintText: "Enter Password"),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () {
                      context.read<AuthBloc>().add(AuthLoginRequestEvent(
                          email: emailController.text.trim(),
                          password: passController.text.trim()));
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      color: Colors.green,
                      child: Center(child: Text('Login')),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
