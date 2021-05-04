import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:promise/api/repository/api_todo_repository.dart';
import 'package:promise/models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({this.todoRepository}) : super(InitialState()) {
    getTodos();
  }

  final ApiTodoRepository todoRepository;

  void getTodos() async {
    try {
      emit(LoadingState());
      final List<Todo> todos = await todoRepository.fetchTodos();
      emit(LoadedState(todos));
    } catch (e) {
      emit(ErrorState());
    }
  }

  void addTodo(Todo item) async {
    try {
      emit(LoadingState());
      await todoRepository.addTodo(item);
      final List<Todo> todos = await todoRepository.fetchTodos();
      emit(LoadedState(todos));
    } catch (e) {
      emit(ErrorState());
    }
  }

  void updateTodo(int id, Todo item) async {
    try {
      emit(LoadingState());
      await todoRepository.updateTodo(id, item);
      final List<Todo> todos = await todoRepository.fetchTodos();
      emit(LoadedState(todos));
    } catch (e) {
      emit(ErrorState());
    }
  }

  void deleteTodo(int id) async {
    try {
      emit(LoadingState());
      todoRepository.deleteTodo(id);
      final List<Todo> todos = await todoRepository.fetchTodos();
      emit(LoadedState(todos));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
