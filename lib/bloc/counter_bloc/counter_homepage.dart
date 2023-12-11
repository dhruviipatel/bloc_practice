import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc/counterpage2.dart';

class CounterHomePage extends StatelessWidget {
  const CounterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Column(
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
                          context
                              .read<CounterBloc>()
                              .add(CounterIncrementEvent());
                        },
                        child: Container(
                          color: Colors.green,
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Icon(Icons.add),
                          ),
                        )),
                    InkWell(
                        onTap: () {
                          context
                              .read<CounterBloc>()
                              .add(CounterDecrementEvent());
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
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CounterPage2()));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
