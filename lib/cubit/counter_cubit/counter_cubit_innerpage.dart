import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/counter_cubit/counter_cubit.dart';

class CounterCubitInnerpage extends StatelessWidget {
  const CounterCubitInnerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  context.read<CounterCubit>().increment();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.green,
                  child: Icon(Icons.add),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<CounterCubit>().decrement();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                  child: Icon(Icons.minimize),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
