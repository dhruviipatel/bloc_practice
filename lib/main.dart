import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/weather_bloc/data_provider.dart';
import 'package:learn_bloc/bloc/weather_bloc/weather_bloc.dart';
import 'package:learn_bloc/bloc/weather_bloc/weather_repository.dart';
import 'package:learn_bloc/bloc/weather_bloc/weather_screen.dart';
// import 'package:learn_bloc/cubit/auth_cubit/auth_cubit.dart';
// import 'package:learn_bloc/cubit/counter_cubit/counter_cubit.dart';
// import 'package:learn_bloc/cubit/todo_cubit/todo_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
        child: BlocProvider(
      create: (_) => WeatherBloc(WeatherRepository(WeatherDataProvider())),
      child:
          MaterialApp(debugShowCheckedModeBanner: false, home: WeatherScreen()),
    )

        // MultiBlocProvider(
        //   providers: [
        //     BlocProvider(create: (_) => CounterBloc()),
        //     BlocProvider(create: (_) => CounterCubit()),
        //     BlocProvider(create: (_) => TodoCubit()),
        //     BlocProvider(create: (_) => AuthBloc()),
        //     BlocProvider(create: (_) => AuthCubit()),
        //     RepositoryProvider(
        //       create: (_) => WeatherRepository(WeatherDataProvider()),
        //       child: BlocProvider(
        //         create: (_) =>
        //             WeatherBloc(WeatherRepository(WeatherDataProvider())),
        //       ),
        //     )
        //   ],
        // child: MaterialApp(
        //     debugShowCheckedModeBanner: false, home: WeatherScreen()),
        // ),

        );
  }
}

// The DismissKeybaord widget (it's reusable)
class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
