import 'package:bloc/bloc.dart';
import 'package:learn_bloc/cubit/todo_cubit/todoModel.dart';

class TodoCubit extends Cubit<List<todoModel>> {
  TodoCubit() : super([]);

  void addInList(String name) {
    if (name.isEmpty) {
      addError('todo can not be emty');
      return;
    }
    final todo = todoModel(name: name, createdAt: DateTime.now());
    List<todoModel> updatedList = List.from(state);
    updatedList.add(todo);
    emit(updatedList);
  }

  void removeFromList(index) {
    List<todoModel> updatedList = List.from(state);
    updatedList.removeAt(index);
    emit(updatedList);
  }

  @override
  void onChange(Change<List<todoModel>> change) {
    super.onChange(change);
    print('TodoCubit $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }
}
