import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/todo_cubit/todo_cubit.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todocontroller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Todo"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: todocontroller,
              decoration: InputDecoration(hintText: "Enter todo"),
            ),
            TextButton(
                onPressed: () {
                  context.read<TodoCubit>().addInList(todocontroller.text);
                  Navigator.pop(context);
                },
                child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
