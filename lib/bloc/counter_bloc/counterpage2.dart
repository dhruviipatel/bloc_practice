import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc/counter_bloc.dart';

class CounterPage2 extends StatelessWidget {
  const CounterPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                context.read<CounterBloc>().add(CounterIncrementEvent());
              },
              child: Container(
                color: Colors.green,
                height: 50,
                width: 50,
                child: Center(
                  child: Icon(Icons.add),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                context.read<CounterBloc>().add(CounterDecrementEvent());
              },
              child: Container(
                color: Colors.yellow,
                height: 50,
                width: 50,
                child: Center(
                  child: Icon(Icons.minimize),
                ),
              ))
        ],
      ),
    );
  }
}
