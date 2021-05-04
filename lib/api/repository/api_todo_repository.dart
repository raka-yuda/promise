import 'package:promise/api/provider/api_todo_provider.dart';
import 'package:promise/models/todo.dart';

class ApiTodoRepository {
  final ApiTodoProvider _apiTodoProvider = ApiTodoProvider();

  Future<List<Todo>> fetchTodos() => _apiTodoProvider.getTodos();

  Future<int> addTodo(Todo item) => _apiTodoProvider.addItem(item);

  Future<int> updateTodo(int id, Todo item) =>
      _apiTodoProvider.updateTodo(id, item);

  Future<int> deleteTodo(int id) => _apiTodoProvider.deleteTodo(id);
}
