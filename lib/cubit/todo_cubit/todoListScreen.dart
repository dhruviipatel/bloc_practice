import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/todo_cubit/add_todo_screen.dart';
import 'package:learn_bloc/cubit/todo_cubit/todoModel.dart';
import 'package:learn_bloc/cubit/todo_cubit/todo_cubit.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todocontroller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todo List"),
        ),
        body: BlocBuilder<TodoCubit, List<todoModel>>(
          builder: (context, todolist) {
            return ListView.builder(
                itemCount: todolist.length,
                itemBuilder: (context, index) {
                  String todo = todolist[index].name;
                  return ListTile(
                    title: Text(todo),
                    trailing: IconButton(
                        onPressed: () {
                          context.read<TodoCubit>().removeFromList(index);
                        },
                        icon: Icon(Icons.remove_circle)),
                  );
                });
          },
        ),
        bottomSheet: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: todocontroller,
                  decoration: InputDecoration(hintText: "Enter todo"),
                ),
              ),
              TextButton(
                  onPressed: () {
                    context.read<TodoCubit>().addInList(todocontroller.text);
                    todocontroller.text = '';
                  },
                  child: Text("Add"))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddTodoScreen()));
          },
          child: Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
