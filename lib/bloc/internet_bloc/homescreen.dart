import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/internet_bloc/internet_bloc.dart';
import 'package:learn_bloc/bloc/internet_bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
              key: UniqueKey(),
              builder: (_, state) {
                if (state is InternetGainedState) {
                  return Text("Connected");
                } else if (state is InternetLostState) {
                  return Text("Not connected");
                } else {
                  return Text("Loading");
                }
              },
              listener: (_, state) {
                if (state is InternetGainedState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Connected")));
                } else if (state is InternetLostState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("DisConnected")));
                }
              })),
    );
  }
}

//main.dart file for this code

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:learn_bloc/bloc/internet_bloc/internet_bloc.dart';
// import 'package:learn_bloc/bloc/network_bloc.dart';
// import 'package:learn_bloc/homescreen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     // BlocProvider(
//     //   create: (context) => NetworkBloc(),
//     HomeScreen(),
//     //),
//   );
// }
