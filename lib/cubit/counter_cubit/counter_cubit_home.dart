import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/counter_cubit/counter_cubit_innerpage.dart';
import 'package:learn_bloc/cubit/counter_cubit/counter_cubit.dart';

class CounterCubitHome extends StatelessWidget {
  const CounterCubitHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$state',
                  style: TextStyle(fontSize: 30),
                ),
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
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CounterCubitInnerpage()));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
