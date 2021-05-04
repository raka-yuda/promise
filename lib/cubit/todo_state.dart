part of 'todo_cubit.dart';

@immutable
abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class InitialState extends TodoState {
  @override
  List<Object> get props => [];
}

class LoadingState extends TodoState {
  @override
  List<Object> get props => [];
}

class LoadedState extends TodoState {
  LoadedState(this.todo);

  final List<Todo> todo;

  @override
  List<Object> get props => [todo];
}

class ErrorState extends TodoState {
  @override
  List<Object> get props => [];
}
