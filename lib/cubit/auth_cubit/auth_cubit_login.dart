import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:learn_bloc/cubit/auth_cubit/auth_cubit_home.dart';

class AuthCubitLogin extends StatelessWidget {
  const AuthCubitLogin({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return Scaffold(
      body: Column(
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
          TextButton(
              onPressed: () {
                if (emailController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Email can not be empty")));
                  return;
                }
                if (passController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("password can not be empty")));
                  return;
                }
                context.read<AuthCubit>().login(
                    emailController.text.trim(), passController.text.trim());

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => AuthCubitHome()),
                    (route) => false);
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
